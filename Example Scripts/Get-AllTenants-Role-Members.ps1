<#
.SYNOPSIS
    Retrieves and exports a list of all tenants and their roles from the CIPP API.

.DESCRIPTION
    This script prompts the user for CIPP API details and a Tenant ID, then retrieves a list of tenants and their roles using the CIPPAPIModule.
    The roles and their members are exported to a CSV file.

.PARAMETER CIPPAPIUrl
    The URL of the CIPP API.

.PARAMETER CIPPClientID
    The Client ID for the CIPP API.

.PARAMETER CIPPClientSecret
    The Client Secret for the CIPP API.

.PARAMETER TenantId
    The Tenant ID for which to retrieve roles.

.OUTPUTS
    Exports a CSV file containing the roles and their members for each tenant.

.NOTES
    The script uses the CIPPAPIModule to interact with the CIPP API.
    The CSV file is saved in the TEMP directory with a filename in the format 'Rolesyyyy-MM-dd.csv'.

.EXAMPLE
    PS> .\Get-AllTenants-Role-Members.ps1
    Enter the CIPP API URL: https://api.example.com
    Enter the CIPP API Client ID: your-client-id
    Enter the CIPP API Client Secret: your-client-secret
    Enter the Tenant ID: your-tenant-id
#>
$CIPPAPIUrl = Read-Host 'Enter the CIPP API URL'
$CIPPClientID = Read-Host 'Enter the CIPP API Client ID'
$CIPPClientSecret = Read-Host 'Enter the CIPP API Client Secret'
$TenantId = Read-Host 'Enter the Tenant ID'

Import-Module CIPPAPIModule
Set-CIPPAPIDetails -CIPPClientID $CIPPClientID -CIPPClientSecret $CIPPClientSecret -CIPPAPIUrl $CIPPAPIUrl -TenantID $TenantId

Write-Output 'Getting List of tenants'
$tenantsList = Get-CIPPTenants
Write-Output 'Getting all customer roles - This can take a few minutes...'
$GlobalAdmins = $tenantsList.defaultDomainName | ForEach-Object -Parallel {
    Import-Module CIPPAPIModule
    Set-CIPPAPIDetails -TenantID $using:TenantId -CIPPClientID $using:CIPPClientID -CIPPClientSecret $using:CIPPClientSecret -CIPPAPIUrl $using:CIPPAPIUrl
    $tenant = $_
    $Roles = Get-CIPPRoles -CustomerTenantID $tenant
    foreach ($Role in $Roles) {
        [PSCustomObject]@{
            Tenant          = $tenant
            Role            = $Role.DisplayName
            Description     = $Role.Description
            Members         = $Role.Members
        }
    }
} -ThrottleLimit 5

if ($null -eq $GlobalAdmins) {
    exit
}

$filename = 'Roles' + (Get-Date -Format 'yyyy-MM-dd') + '.csv'
$filepath = "$env:TEMP\$($filename)"

$GlobalAdmins | Export-Csv -Path $filepath

Start-Process -FilePath $filepath