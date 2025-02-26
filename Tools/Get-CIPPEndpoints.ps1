Set-Location -Path $PSScriptRoot
Set-Location ..
Set-Location ..


$AllCippEndpoints = Get-ChildItem -Path 'CIPP-API\Modules\CIPPCore\Public' -Recurse -Filter 'Invoke-*.ps1' -File | Where-Object { $_.Name -notlike '*CIPPStandard*' }
$AllCippApiModuleEndpoints = Get-ChildItem -Path 'CIPPAPIModule\CIPPAPIModule\public' -Recurse -File

$IgnoredEndpoints = @(
    'Invoke-ExecListAppId' # This endpoint is used in the SAM setup and it might be a bad idea to have it in the CIPP API Module
    'Invoke-ExecSendOrgMessage' # WIP Endpoint
    'Invoke-ListUserSettings' # Relies on header parameters
    'Invoke-AddSiteBulk' # Makes no sense to have this in the CIPP API Module, when you can just use the add single site endpoint in a foreach
)

# Remove ignored endpoints from AllCippEndpoints
$AllCippEndpoints = $AllCippEndpoints | Where-Object { $_.BaseName -notin $IgnoredEndpoints }

# Get the content of all the CIPP API Module endpoints and add them to an object
$AllCippApiModuleEndpointsContent = foreach ($endpoint in $AllCippApiModuleEndpoints) {
    $Content = Get-Content -Path $endpoint.FullName
    [PSCustomObject]@{
        FullPath = $endpoint.FullName
        Name     = $endpoint.Name
        Content  = $Content
    }
}

# Loop through all the CIPP API endpoints and test if they are present in the CIPP API Module somewhere in the content of $AllCippApiModuleEndpointsContent.Content
$Results = foreach ($endpoint in $AllCippEndpoints) {
    $ApiName = $endpoint.BaseName -replace 'Invoke-', ''
    $Found = $AllCippApiModuleEndpointsContent | Where-Object { $_.Content -like "*'/api/$($ApiName)'*" }
    
    [PSCustomObject]@{
        APIEndpoint    = $ApiName
        Status         = if ($Found) { 'Found' } else { 'Missing' }
        Location       = if ($Found) { $Found.Name -join ';' } else { 'N/A' }
        SourceFile     = $endpoint.Name
        SourceFullPath = $endpoint.FullName
        TargetFile     = if ($Found) { $Found.FullPath -join ';' } else { 'N/A' }
    }
}

Write-Host "`nCIPP API Endpoint Coverage Report`n" -ForegroundColor Cyan
Write-Host "================================`n" -ForegroundColor Cyan

foreach ($result in $Results) {
    Write-Host 'Endpoint: ' -NoNewline
    Write-Host $result.APIEndpoint -ForegroundColor Yellow -NoNewline
    Write-Host ' - Status: ' -NoNewline
    
    if ($result.Status -eq 'Found') {
        Write-Host $result.Status -ForegroundColor Green -NoNewline
        Write-Host ' in ' -NoNewline
        Write-Host $result.Location -ForegroundColor Blue
    } else {
        Write-Host $result.Status -ForegroundColor Red
    }
}

# Summary
$TotalEndpoints = $Results.Count
$FoundEndpoints = ($Results | Where-Object { $_.Status -eq 'Found' }).Count
$MissingEndpoints = $TotalEndpoints - $FoundEndpoints
$Percentage = [math]::Round(($FoundEndpoints / $TotalEndpoints) * 100, 2)

Write-Host "`nSummary" -ForegroundColor Cyan
Write-Host "========`n" -ForegroundColor Cyan
Write-Host 'Total Endpoints: ' -NoNewline
Write-Host $TotalEndpoints -ForegroundColor Yellow
Write-Host 'Found: ' -NoNewline
Write-Host $FoundEndpoints -ForegroundColor Green
Write-Host 'Missing: ' -NoNewline
Write-Host $MissingEndpoints -ForegroundColor Red
Write-Host 'Percentage of Endpoints with a function: ' -NoNewline
Write-Host "$Percentage%" -ForegroundColor Yellow

# Export to CSV
$ExportPath = Join-Path $PSScriptRoot "CIPPEndpointsCoverage_$(Get-Date -Format 'yyyyMMdd_HHmmss').csv"
$Results | Where-Object { $_.Status -ne 'Found' } | Sort-Object APIEndpoint | Export-Csv -Path $ExportPath -NoTypeInformation
# $Results | Export-Csv -Path $ExportPath -NoTypeInformation

Write-Host "`nExport Details" -ForegroundColor Cyan
Write-Host "==============`n" -ForegroundColor Cyan
Write-Host 'CSV exported to: ' -NoNewline
Write-Host $ExportPath -ForegroundColor Green

# Return results object for pipeline usage
# return $Results