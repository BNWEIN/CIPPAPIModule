<#
.SYNOPSIS
This script retrieves a list of licensed users from multiple tenants using the CIPP API.

.DESCRIPTION
The script prompts the user to enter the CIPP API URL, client ID, client secret, and tenant ID. It then imports the CIPPAPIModule and sets the CIPP API details using the provided inputs.

The script retrieves a list of tenants using the Get-CIPPTenants function. It then retrieves all users from each tenant using the Get-CIPPUsers function. Only users with assigned licenses are included in the result.

The script creates a custom object for each licensed user, including the tenant, display name, user principal name, account enabled status, and license information.

The resulting licensed users are exported to a CSV file with a filename that includes the current date. The CSV file is saved in the user's temporary folder and opened using the default application associated with CSV files.

.PARAMETER CIPPAPIUrl
The URL of the CIPP API.

.PARAMETER CIPPClientID
The client ID for accessing the CIPP API.

.PARAMETER CIPPClientSecret
The client secret for accessing the CIPP API.

.PARAMETER TenantId
The ID of the tenant to retrieve licensed users from.

.EXAMPLE
.\Get-AllTenants-LicensedUsers.ps1
Prompts the user to enter the CIPP API URL, client ID, client secret, and tenant ID. Retrieves a list of licensed users from multiple tenants using the CIPP API.

#>

$CIPPAPIUrl = Read-Host "Enter the CIPP API URL"
$CIPPClientID = Read-Host "Enter the CIPP API Client ID"
$CIPPClientSecret = Read-Host "Enter the CIPP API Client Secret"
$TenantId = Read-Host "Enter the Tenant ID"

Import-Module CIPPAPIModule
Set-CIPPAPIDetails -CIPPClientID $CIPPClientID -CIPPClientSecret $CIPPClientSecret -CIPPAPIUrl $CIPPAPIUrl -TenantId $TenantId

Write-Output "Getting List of tenants"
$tenantsList = Get-CIPPTenants
Write-Output "Getting all users - This can take a few minutes..."
$licensedUsers = $tenantsList.defaultDomainName | ForEach-Object -Parallel {
    Import-Module CIPPAPIModule
    Set-CIPPAPIDetails -TenantID $using:TenantId -CIPPClientID $using:CIPPClientID -CIPPClientSecret $using:CIPPClientSecret -CIPPAPIUrl $using:CIPPAPIUrl
    $tenant = $_
    $users = Get-CIPPUsers -CustomerTenantID $tenant | Where-Object {$_.assignedLicenses -ne $null}
    foreach ($User in $users) {
        [PSCustomObject]@{
            Tenant = $tenant
            displayName = $User.displayName
            User = $User.UserPrincipalName
            accountEnabled = $User.accountEnabled
            License = $User.LicJoined
        }
    }
} -ThrottleLimit 5

if ($null -eq $licensedUsers) {
    exit
}

$filename = "licensedUsers" + (Get-Date -Format "yyyy-MM-dd") + ".csv"
$filepath = "$env:TEMP\$($filename)"

$licensedUsers | Export-CSV -Path $filepath

Start-Process -FilePath $filepath