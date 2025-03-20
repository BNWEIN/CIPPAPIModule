<#
.SYNOPSIS
    Offboards a user from a specified customer tenant.

.DESCRIPTION
    The New-CIPPUserOffboarding function automates the offboarding process for a user in a specified customer tenant. 
    It provides various options to customize the offboarding process, including forwarding emails, converting the mailbox 
    to a shared mailbox, disabling sign-in, removing licenses, and more. It is also possible to schedule the offboarding for a later date.

.PARAMETER CustomerTenantID
    The ID of the customer tenant from which the user is being offboarded. This parameter is mandatory.

.PARAMETER User
    The username of the user being offboarded. UserPrincipalName(UPN) should be used. This parameter is mandatory.

.PARAMETER OutOfOffice
    Sets an out-of-office message for the user. This parameter is optional.

.PARAMETER ForwardTo
    Forwards the user's emails to another address. This parameter is optional.

.PARAMETER ForwardKeepCopyInMailbox
    Keeps a copy of forwarded emails in the user's mailbox. This parameter is optional.

.PARAMETER OnedriveAccessTo
    Grants access to the user's OneDrive to another user. UserPrincipalName(UPN) should be used. This parameter is optional.

.PARAMETER MailboxAccessNoAutomap
    Grants access to the user's mailbox without automapping. UserPrincipalName(UPN) should be used. This parameter is optional.

.PARAMETER MailboxAccessAutomap
    Grants access to the user's mailbox with automapping. UserPrincipalName(UPN) should be used. This parameter is optional.

.PARAMETER ConvertToSharedMailbox
    Converts the user's mailbox to a shared mailbox. This parameter is optional.

.PARAMETER HideFromGAL
    Hides the user from the Global Address List (GAL). This parameter is optional.

.PARAMETER DisableSignIn
    Disables sign-in for the user. This parameter is optional.

.PARAMETER DeleteUser
    Deletes the user account. This parameter is optional.

.PARAMETER RemoveFromAllGroups
    Removes the user from all groups. This parameter is optional.

.PARAMETER CancelAllCalendarInvites
    Cancels all calendar invites for the user. This parameter is optional.

.PARAMETER RemoveAllLicenses
    Removes all licenses assigned to the user. This parameter is optional.

.PARAMETER ResetPassword
    Resets the user's password. This parameter is optional.

.PARAMETER RevokeAllSessions
    Revokes all active sessions for the user. This parameter is optional.

.PARAMETER RemoveAllMailboxRules
    Removes all mailbox rules for the user. This parameter is optional.

.PARAMETER RemoveAllMobileDevices
    Removes all mobile devices associated with the user. This parameter is optional.

.PARAMETER RemoveAllMailboxPermissions
    Removes all mailbox permissions for the user. This parameter is optional.

.PARAMETER ScheduledFor
    Specifies the date and time when the user should be added. If not specified, the user will be offboarded immediately.
    Input should be a valid datetime object. Will be converted to Unix time.
    This parameter is optional.

.PARAMETER SendResultsToEmail
    Specifies whether to send the results of the scheduled task to the email address specified in the notification settings of your CIPP instance.
    This parameter is optional.

.PARAMETER SendResultsToPSA
    Specifies whether to send the results of the scheduled task to the PSA system specified in the notification settings of your CIPP instance.
    This parameter is optional.

.PARAMETER SendResultsToWebhook
    Specifies whether to send the results of the scheduled task to the webhook specified in the notification settings of your CIPP instance.
    This parameter is optional.

.EXAMPLE
    New-CIPPUserOffboarding -CustomerTenantID "8ad00f9e-1953-47d1-897b-8fec4138cde7" -User "jdoe@domain.com" -DisableSignIn -RemoveAllLicenses -ConvertToSharedMailbox

    This example immediately offboards the user "jdoe@domain.com" from the customer tenant with ID "8ad00f9e-1953-47d1-897b-8fec4138cde7", disables sign-in, removes all licenses, and converts the user's mailbox to a shared mailbox.

.EXAMPLE
    New-CIPPUserOffboarding -CustomerTenantID "8ad00f9e-1953-47d1-897b-8fec4138cde7" -User "jane.doe@domain.com" -DeleteUser -ScheduledFor ((Get-Date).AddDays(7)) -SendResultsToEmail
    
    This example schedules the offboarding of the user "jane.doe@domain.com" from the customer tenant with ID "8ad00f9e-1953-47d1-897b-8fec4138cde7" for 7 days from the current date. 
    The results of the scheduled task will be sent to the email address specified in the notification settings of your CIPP instance.

#>
function New-CIPPUserOffboarding {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$User,
        [Parameter(Mandatory = $false)]
        [string]$OutOfOffice,
        [Parameter(Mandatory = $false)]
        [string]$ForwardTo,
        [switch]$ForwardKeepCopyInMailbox,
        [Parameter(Mandatory = $false)]
        [string]$OnedriveAccessTo,
        [Parameter(Mandatory = $false)]
        [string]$MailboxAccessNoAutomap,
        [Parameter(Mandatory = $false)]
        [string]$MailboxAccessAutomap,
        [switch]$ConvertToSharedMailbox,
        [switch]$HideFromGAL,
        [switch]$DisableSignIn,
        [switch]$DeleteUser,
        [switch]$RemoveFromAllGroups,
        [switch]$CancelAllCalendarInvites,
        [switch]$RemoveAllLicenses,
        [switch]$ResetPassword,
        [switch]$RevokeAllSessions,
        [switch]$RemoveAllMailboxRules,
        [switch]$RemoveAllMobileDevices,
        [switch]$RemoveAllMailboxPermissions,
        [datetime]$ScheduledFor,
        [switch]$SendResultsToEmail,
        [switch]$SendResultsToPSA,
        [switch]$SendResultsToWebhook


    )

    Write-Verbose "Offboarding user $User from $CustomerTenantID"
    $endpoint = '/api/ExecOffboardUser'
    $body = @{
        tenantFilter = $CustomerTenantID
        user         = @{ value = $User }
    }
    
    
    $optionalParams = @{
        OOO                   = $OutOfOffice
        forward               = $ForwardTo
        keepCopy              = $ForwardKeepCopyInMailbox.IsPresent ? $true : $null
        OnedriveAccess        = @{ value = $OnedriveAccessTo }
        AccessNoAutomap       = @{ value = $MailboxAccessNoAutomap }
        AccessAutomap         = @{ value = $MailboxAccessAutomap }
        ConvertToShared       = $ConvertToSharedMailbox.IsPresent ? $true : $null
        HideFromGAL           = $HideFromGAL.IsPresent ? $true : $null
        DisableSignIn         = $DisableSignIn.IsPresent ? $true : $null
        RemoveGroups          = $RemoveFromAllGroups.IsPresent ? $true : $null
        removeCalendarInvites = $CancelAllCalendarInvites.IsPresent ? $true : $null
        RemoveLicenses        = $RemoveAllLicenses.IsPresent ? $true : $null
        ResetPass             = $ResetPassword.IsPresent ? $true : $null
        RevokeSessions        = $RevokeAllSessions.IsPresent ? $true : $null
        deleteuser            = $DeleteUser.IsPresent ? $true : $null
        removeRules           = $RemoveAllMailboxRules.IsPresent ? $true : $null
        removeMobile          = $RemoveAllMobileDevices.IsPresent ? $true : $null
        removePermissions     = $RemoveAllMailboxPermissions.IsPresent ? $true : $null
        Scheduled             = @{
            enabled = $ScheduledFor -ne $null
            date    = if ($ScheduledFor) { ([System.DateTimeOffset]$ScheduledFor).ToUnixTimeSeconds() } else { $null }
        }
        PostExecution         = @{
            webhook = $SendResultsToWebhook.IsPresent ? $true : $null
            psa     = $SendResultsToPSA.IsPresent ? $true : $null
            email   = $SendResultsToEmail.IsPresent ? $true : $null
        }

    }

    # Add optional parameters to the body if they are not null
    foreach ($key in $optionalParams.Keys) {
        if ($optionalParams[$key]) {
            $body[$key] = $optionalParams[$key]
        }
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method 'POST'
}
