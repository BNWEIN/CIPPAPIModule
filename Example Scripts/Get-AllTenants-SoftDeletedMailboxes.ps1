<#
.SYNOPSIS
This script retrieves a list of soft deleted mailboxes for all tenants using the CIPP API.

.DESCRIPTION
The script prompts the user to enter the CIPP API URL, client ID, client secret, and tenant ID. It then imports the CIPPAPIModule and sets the CIPP API details using the provided inputs.

The script retrieves a list of tenants using the Get-CIPPTenants function and then retrieves the soft deleted mailboxes for each tenant in parallel using the Get-CIPPMailboxes function. The retrieved mailbox information is stored in a custom object and exported to a CSV file.

.PARAMETER CIPPAPIUrl
The URL of the CIPP API.

.PARAMETER CIPPClientID
The client ID for accessing the CIPP API.

.PARAMETER CIPPClientSecret
The client secret for accessing the CIPP API.

.PARAMETER TenantId
The ID of the tenant.

.OUTPUTS
SoftDeletedMailboxes.csv - A CSV file containing the soft deleted mailbox information for all tenants.

.EXAMPLE
PS C:\> .\Get-AllTenants-SoftDeletedMailboxes.ps1

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
Write-Output 'Getting all customers soft deleted mailboxes - This can take a few minutes...'
$DeletedMailboxes = $tenantsList.defaultDomainName | ForEach-Object -Parallel {
    Import-Module CIPPAPIModule
    Set-CIPPAPIDetails -TenantID $using:TenantId -CIPPClientID $using:CIPPClientID -CIPPClientSecret $using:CIPPClientSecret -CIPPAPIUrl $using:CIPPAPIUrl
    $tenant = $_
    $Deleted = Get-CIPPMailboxes -CustomerTenantID $tenant -SoftDeletedMailboxes
    foreach ($mailbox in $Deleted) {
        if ($mailbox.IsInactiveMailbox -ne $true) {
            [PSCustomObject]@{
                Tenant                     = $tenant
                MailBoxDeletedDate         = $mailbox.WhenSoftDeleted
                DisplayName                = $mailbox.DisplayName
                UserPrincipalName          = $mailbox.UPN
                PrimarySmtpAddress         = $mailbox.PrimarySmtpAddress
                MailboxType                = $mailbox.RecipientType
                MailboxStatus              = $mailbox.RecipientTypeDetails
                IsInactiveMailbox          = $mailbox.IsInactiveMailbox
                RecipientSoftDeletedStatus = $mailbox.RecipientSoftDeletedStatus
            }
        }
    }
} -ThrottleLimit 5

if ($null -eq $DeletedMailboxes) {
    exit
}

$filename = 'SoftDeletedMailboxes' + (Get-Date -Format 'yyyy-MM-dd') + '.csv'
$filepath = "$env:TEMP\$($filename)"

$DeletedMailboxes | Export-Csv -Path $filepath

Start-Process -FilePath $filepath