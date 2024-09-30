<#
.SYNOPSIS
This script retrieves a list of tenants and their shared mailboxes with account enabled using the CIPP API.

.DESCRIPTION
The script prompts the user to enter the CIPP API URL, client ID, client secret, and tenant ID. It then imports the CIPPAPIModule and sets the CIPP API details using the provided inputs.

The script retrieves a list of tenants using the Get-CIPPTenants function from the CIPPAPIModule. It then iterates through each tenant in parallel and retrieves the shared mailboxes with account enabled using the Get-CIPPEnabledSharedMailboxe function from the CIPPAPIModule. For each shared mailbox, it creates a custom object with properties such as Tenant, UserPrincipalName, DisplayName, GivenName, Surname, AccountEnabled, and onPremisesSyncEnabled.

If no shared mailboxes with account enabled are found, the script exits. Otherwise, it exports the data to a CSV file with a filename based on the current date and saves it to the user's temporary folder. Finally, it opens the CSV file using the default application associated with CSV files.

.PARAMETER CIPPAPIUrl
The URL of the CIPP API.

.PARAMETER CIPPClientID
The client ID for accessing the CIPP API.

.PARAMETER CIPPClientSecret
The client secret for accessing the CIPP API.

.PARAMETER TenantId
The ID of the tenant.

.EXAMPLE
PS C:\> .\Get-AllTenants-SharedMailboxesEnabledAccount.ps1

.NOTES
This script requires the CIPPAPIModule to be installed.
#>

$CIPPAPIUrl = Read-Host 'Enter the CIPP API URL'
$CIPPClientID = Read-Host 'Enter the CIPP API Client ID'
$CIPPClientSecret = Read-Host 'Enter the CIPP API Client Secret'
$TenantId = Read-Host 'Enter the Tenant ID'

Import-Module CIPPAPIModule
Set-CIPPAPIDetails -CIPPClientID $CIPPClientID -CIPPClientSecret $CIPPClientSecret -CIPPAPIUrl $CIPPAPIUrl -TenantID $TenantId

Write-Output 'Getting List of tenants'
$tenantsList = Get-CIPPTenants
Write-Output 'Getting all shared mailboxes with account enabled - This can take a few minutes...'
$SharedMailboxesEnabled = $tenantsList.defaultDomainName | ForEach-Object -Parallel {
    Import-Module CIPPAPIModule
    Set-CIPPAPIDetails -TenantID $using:TenantId -CIPPClientID $using:CIPPClientID -CIPPClientSecret $using:CIPPClientSecret -CIPPAPIUrl $using:CIPPAPIUrl
    $tenant = $_
    $SharedMailboxes = Get-CIPPEnabledSharedMailboxes -CustomerTenantID $tenant
    foreach ($mailbox in $SharedMailboxes) {
        [PSCustomObject]@{
            Tenant                = $tenant
            UserPrincipalName     = $mailbox.UserPrincipalName
            DisplayName           = $mailbox.DisplayName
            GivenName             = $mailbox.GivenName
            Surname               = $mailbox.Surname
            AccountEnabled        = $mailbox.AccountEnabled
            onPremisesSyncEnabled = $mailbox.onPremisesSyncEnabled
        }
    }
} -ThrottleLimit 5

if ($null -eq $SharedMailboxesEnabled) {
    exit
}

$filename = 'SharedMailboxesAccountEnabled' + (Get-Date -Format 'yyyy-MM-dd') + '.csv'
$filepath = "$env:TEMP\$($filename)"

$SharedMailboxesEnabled | Export-Csv -Path $filepath

Start-Process -FilePath $filepath