<#
.SYNOPSIS
    Revokes all active sessions for a specified user.

.DESCRIPTION
    The Revoke-CIPPUserSessions function terminates all active user sessions for a specified user in a given tenant.
    This is useful for security incidents or when immediate account access revocation is needed.

.PARAMETER CustomerTenantID
    The tenant ID of the customer where the user account is located.

.PARAMETER UserID
    The unique identifier (GUID) of the user whose sessions should be revoked.

.PARAMETER UserName
    The username or display name of the user whose sessions should be revoked.

.EXAMPLE
    Revoke-CIPPUserSessions -CustomerTenantID "contoso.onmicrosoft.com" -UserID "12345678-1234-1234-1234-123456789012" -UserName "john.doe@contoso.com"

.EXAMPLE
    Set-CIPPRevokeSessions -CustomerTenantID "fabrikam.onmicrosoft.com" -UserID "87654321-4321-4321-4321-210987654321" -UserName "jane.smith@fabrikam.com"

.NOTES
    This command will immediately sign out the user from all devices and applications.
    The user will need to reauthenticate on all devices and services.

.LINK
    https://cipp.app/
#>
function Revoke-CIPPUserSessions {
    [CmdletBinding()]
    [Alias('Set-CIPPRevokeSessions')]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID,
        [Parameter(Mandatory = $true)]
        [string]$UserName
    )

    Write-Verbose "Revoking Sessions for user: $UserID"

    $endpoint = '/api/ExecRevokeSessions'
    $Body = @{
        tenantFilter = $CustomerTenantID
        ID           = $UserID
        UserName     = $UserName

    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $Body -Method POST
}
