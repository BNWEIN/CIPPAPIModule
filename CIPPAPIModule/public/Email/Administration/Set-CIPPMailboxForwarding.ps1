<#
.SYNOPSIS
Sets mailbox forwarding for a user.

.DESCRIPTION
The Set-CIPPMailboxForwarding function sets mailbox forwarding for a user. It allows you to specify the customer tenant ID, user ID, and various forwarding options such as external and internal email addresses, disabling forwarding, and keeping a copy of forwarded emails.

.PARAMETER CustomerTenantID
The ID of the customer tenant.

.PARAMETER UserID
The ID of the user whose mailbox forwarding needs to be set.

.PARAMETER DisableForwarding
Specifies whether to disable mailbox forwarding. By default, it is set to $false.

.PARAMETER ForwardExternalEmailAddress
The external email address to forward emails to.

.PARAMETER ForwardInternalEmailAddress
The internal email address to forward emails to. This parameter accepts an array of email addresses.

.PARAMETER KeepCopy
Specifies whether to keep a copy of forwarded emails. By default, it is set to $false.

.EXAMPLE
Set-CIPPMailboxForwarding -CustomerTenantID "contoso.onmicrosoft.com" -UserID "john.doe@contoso.onmicrosoft.com" -ForwardExternalEmailAddress "john.doe@example.com" -KeepCopy $true
This example sets mailbox forwarding for the user "john.doe@contoso.onmicrosoft.com" in the customer tenant with ID "contoso.onmicrosoft.com". Emails will be forwarded to the external email address "john.doe@example.com". A copy of forwarded emails will be kept.

#>

function Set-CIPPMailboxForwarding {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID,
        [Parameter(Mandatory = $false)]
        [bool]$DisableForwarding,
        [Parameter(Mandatory = $false)]
        [string]$ForwardExternalEmailAddress,
        [Parameter(Mandatory = $false)]
        [string]$ForwardInternalEmailAddress,
        [Parameter(Mandatory = $false)]
        [bool]$KeepCopy
    )

    Write-Verbose "Forwarding Mailbox for $UserID to $ForwardExternalEmailAddress $ForwardInternalEmailAddress"
    $endpoint = '/api/ExecEmailForward'
    $body = @{
        tenantFilter      = $CustomerTenantID
        ForwardExternal   = $ForwardExternalEmailAddress
        ForwardInternal   = (ConvertTo-FormattedArray -inputArray $ForwardInternalEmailAddress -labelPrefix $ForwardInternalEmailAddress)
        KeepCopy          = $KeepCopy
        userid            = $UserID
        disableForwarding = $DisableForwarding
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}