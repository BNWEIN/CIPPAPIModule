<#
.SYNOPSIS
This script retrieves a list of tenants and their licenses using the CIPP API.

.DESCRIPTION
The script prompts the user to enter the CIPP API URL, client ID, client secret, and tenant ID.
It then imports the CIPPAPIModule and sets the CIPP API details using the provided inputs.
The script retrieves a list of tenants using the Get-CIPPTenants function.
For each tenant, it retrieves the licenses using the Get-CIPPLicenses function.
The script creates a custom object for each license and outputs the results.
Finally, it exports the results to a CSV file and opens it using the default application.

.PARAMETER CIPPAPIUrl
The URL of the CIPP API.

.PARAMETER CIPPClientID
The client ID for accessing the CIPP API.

.PARAMETER CIPPClientSecret
The client secret for accessing the CIPP API.

.PARAMETER TenantId
The ID of the tenant.

.EXAMPLE
.\Get-AllTenants-Licenses.ps1

.NOTES
This script requires the CIPPAPIModule to be installed.
#>

$CIPPAPIUrl = Read-Host "Enter the CIPP API URL"
$CIPPClientID = Read-Host "Enter the CIPP API Client ID"
$CIPPClientSecret = Read-Host "Enter the CIPP API Client Secret"
$TenantId = Read-Host "Enter the Tenant ID"

Import-Module CIPPAPIModule
Set-CIPPAPIDetails -CIPPClientID $CIPPClientID -CIPPClientSecret $CIPPClientSecret -CIPPAPIUrl $CIPPAPIUrl -TenantId $TenantId

Write-Output "Getting List of tenants"
$tenantsList = Get-CIPPTenants
Write-Output "Getting all customer licenses - This can take a few minutes..."
$CustomerLicenses = $tenantsList.defaultDomainName | ForEach-Object -Parallel {
    Import-Module CIPPAPIModule
    Set-CIPPAPIDetails -TenantID $using:TenantId -CIPPClientID $using:CIPPClientID -CIPPClientSecret $using:CIPPClientSecret -CIPPAPIUrl $using:CIPPAPIUrl
    $tenant = $_
    $Licenses = Get-CIPPLicenses -CustomerTenantID $tenant
    foreach ($License in $Licenses) {
        [PSCustomObject]@{
            Tenant = $tenant
            License = $License.License
            CountUsed = $License.CountUsed
            CountAvailable = $License.CountAvailable
            TotalLicenses = $License.TotalLicenses
            skuid = $License.skuid
            skuPartNumber = $License.skuPartNumber
        }
    }
} -ThrottleLimit 5

if ($null -eq $CustomerLicenses) {
    exit
}

$filename = "CustomerLicenses" + (Get-Date -Format "yyyy-MM-dd") + ".csv"
$filepath = "$env:TEMP\$($filename)"

$CustomerLicenses | Export-CSV -Path $filepath

Start-Process -FilePath $filepath