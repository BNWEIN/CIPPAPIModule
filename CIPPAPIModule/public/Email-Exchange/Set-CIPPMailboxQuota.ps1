<#
.SYNOPSIS
Sets the mailbox quota for a user

.DESCRIPTION
The Set-CIPPMailboxQuota function is used to set the mailbox quota for a user. It allows you to specify the customer tenant ID, user ID, and the mailbox quota limits such as ProhibitSendQuota, IssueWarningQuota, and ProhibitSendReceiveQuota.

.PARAMETER CustomerTenantID
The ID of the customer tenant.

.PARAMETER UserID
The ID of the user.

.PARAMETER ProhibitSendQuota
The maximum mailbox size (in MB, GB or TB) at which sending messages is prohibited.

.PARAMETER IssueWarningQuota
The mailbox size (in MB, GB or TB) at which a warning is issued to the user.

.PARAMETER ProhibitSendReceiveQuota
The maximum mailbox size (in MB, GB or TB) at which sending and receiving messages is prohibited.

.EXAMPLE
Set-CIPPMailboxQuota -CustomerTenantID "contoso.onmicrosoft.com" -UserID "john.doe@contoso.com" -ProhibitSendQuota "1GB"
Sets the mailbox quota for the user "john.doe" in the customer tenant with ID "contoso.onmicrosoft.com". The ProhibitSendQuota is set to 1GB

.EXAMPLE
Set-CIPPMailboxQuota -CustomerTenantID "contoso.onmicrosoft.com" -UserID "john.doe@contoso.com" -ProhibitSendReceiveQuota "5GB"
Sets the mailbox quota for the user "john.doe" in the customer tenant with ID "contoso.onmicrosoft.com". The ProhibitSendReceiveQuota is set to 5GB

.NOTES
This function requires the Invoke-CIPPRestMethod function to be available. You can only use one parameter at a time: ProhibitSendQuota, IssueWarningQuota, or ProhibitSendReceiveQuota.
#>

function Set-CIPPMailboxQuota {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID,
        [Parameter(Mandatory = $false)]
        [string]$ProhibitSendQuota,
        [Parameter(Mandatory = $false)]
        [string]$IssueWarningQuota,
        [Parameter(Mandatory = $false)]
        [string]$ProhibitSendReceiveQuota
    )
    
    
    Write-Verbose "Setting Mailbox Quota for $userID"
    
    $endpoint = '/api/execsetmailboxquota'
    $body = @{
        tenantfilter = $CustomerTenantID
        user         = $UserID
    }

    if ($ProhibitSendQuota) {
        $body.Add('ProhibitSendQuota', 'true')
        $body.Input = $ProhibitSendQuota
    } elseif ($IssueWarningQuota) {
        $body.Add('IssueWarningQuota', 'true')
        $body.input = $IssueWarningQuota
    } elseif ($ProhibitSendReceiveQuota) {
        $body.Add('ProhibitSendReceiveQuota', 'true')
        $body.input = $ProhibitSendReceiveQuota
    } else {
        throw 'At least one of the following parameters must be provided: ProhibitSendQuota, IssueWarningQuota, ProhibitSendReceiveQuota'
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method 'POST'
}