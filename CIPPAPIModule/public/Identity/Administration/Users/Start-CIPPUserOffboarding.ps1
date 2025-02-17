<#
.SYNOPSIS
Starts an offboarding job for a user in the specified tenant.

.DESCRIPTION
The Start-CIPPOffboardingJob function initiates the offboarding process for a user, handling various cleanup tasks like removing licenses and revoking sessions.

.PARAMETER CustomerTenantID
The ID of the customer tenant. If not provided, the default tenant is used.

.PARAMETER UserID
The ID of the user to be offboarded.

.PARAMETER ConvertToShared
Convert the mailbox to a shared mailbox.

.PARAMETER RevokeSessions
Revoke all active sessions for the user.

.PARAMETER ResetPass
Reset the user's password.

.PARAMETER RemoveGroups
Remove the user from all groups.

.PARAMETER HideFromGAL
Hide the user from the Global Address List.

.PARAMETER DisableSignIn
Disable the user's sign-in capability.

.PARAMETER OnedriveAccess
Grant OneDrive access to specified users.

.PARAMETER AccessNoAutomap
Grant mailbox access without automapping.

.PARAMETER AccessAutomap
Grant mailbox access with automapping.

.PARAMETER OOO
Set out-of-office message.

.PARAMETER Forward
Set email forwarding.

.PARAMETER RemoveLicenses
Remove all licenses assigned to the user.

.PARAMETER DeleteUser
Delete the user account.

.PARAMETER RemoveRules
Remove all mailbox rules.

.PARAMETER RemoveMobile
Remove all mobile devices associated with the user.

.PARAMETER RemoveCalendarInvites
Remove all calendar invites for the user.

.PARAMETER RemovePermissions
Remove all mailbox permissions.

.PARAMETER RemoveMFADevices
Remove all MFA devices associated with the user.

.PARAMETER ClearImmutableId
Clear the immutable ID for the user.

.EXAMPLE
Start-CIPPOffboardingJob -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "98765432-1234-5678-9012-34567890ABCD" -RevokeSessions -RemoveGroups -DeleteUser
This example starts an offboarding job for the user with the specified ID in the customer tenant with the specified ID, revoking sessions, removing groups, and deleting the user account.
#>
function Start-CIPPUserOffboarding {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [guid]$UserID,
        [switch]$ConvertToSharedMailbox,
        [switch]$HideFromGAL,
        [switch]$RemoveCalendarInvites,
        [switch]$RemovePermissions,
        [switch]$RemoveRules,
        [switch]$RemoveMobileDevices,
        [switch]$RemoveGroups,
        [switch]$RemoveLicenses,
        [switch]$RevokeSessions,
        [switch]$DisableSignIn,
        [switch]$ClearImmutableId,
        [switch]$ResetPass,
        [switch]$RemoveMFADevices,
        [switch]$DeleteUser,
        [string[]]$OnedriveAccess,
        [string[]]$FullAccessNoAutomap,
        [string[]]$FullAccessAutomap,
        [string]$OutOfOffice,
        [string]$ForwardTo,
        [switch]$KeepCopy
    )

    Write-Verbose "Starting offboarding job for user: $UserID"


    $OnedriveAccess = $OnedriveAccess | ForEach-Object {
        [pscustomobject]@{
            value = $_
        }
    }
    
    $FullAccessNoAutomap = $FullAccessNoAutomap | ForEach-Object {
        [pscustomobject]@{
            value = $_
        }
    }
    
    $FullAccessAutomap = $FullAccessAutomap | ForEach-Object {
        [pscustomobject]@{
            value = $_
        }
    }

    $endpoint = '/api/CIPPOffboardingJob'
    $params = @{
        tenantFilter = $CustomerTenantID
        id           = $UserID
        options      = @{
            ConvertToSharedMailbox = $ConvertToSharedMailbox.IsPresent
            RevokeSessions         = $RevokeSessions.IsPresent
            ResetPass              = $ResetPass.IsPresent
            RemoveGroups           = $RemoveGroups.IsPresent
            HideFromGAL            = $HideFromGAL.IsPresent
            DisableSignIn          = $DisableSignIn.IsPresent
            OnedriveAccess         = $OnedriveAccess
            AccessNoAutomap        = $FullAccessNoAutomap
            AccessAutomap          = $FullAccessAutomap
            OOO                    = $OutOfOffice
            forward                = $ForwardTo
            keepCopy               = $KeepCopy.IsPresent
            RemoveLicenses         = $RemoveLicenses.IsPresent
            deleteuser             = $DeleteUser.IsPresent
            removeRules            = $RemoveRules.IsPresent
            removeMobile           = $RemoveMobileDevices.IsPresent
            removeCalendarInvites  = $RemoveCalendarInvites.IsPresent
            removePermissions      = $RemovePermissions.IsPresent
            RemoveMFADevices       = $RemoveMFADevices.IsPresent
            ClearImmutableId       = $ClearImmutableId.IsPresent
        }
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}