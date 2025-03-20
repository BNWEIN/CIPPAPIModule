<#
.SYNOPSIS
Revokes sessions for a specified user in the CIPP system.

.DESCRIPTION
The Set-CIPPRevokeSessions function revokes sessions for a specified user in the CIPP system. It sends a request to the CIPP API to revoke all active sessions for the specified user.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which the sessions need to be revoked.

.PARAMETER UserID
The ID of the user for whom the sessions need to be revoked.

.EXAMPLE
Set-CIPPRevokeSessions -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc"
Revokes all sessions for the user with ID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc" in the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>

function Set-CIPPRevokeSessions {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID,
        [Parameter(Mandatory = $true)]
        [string]$UserName
    )

    Write-Verbose "Revoking Sessions for user: $UserID"

    $endpoint = '/api/execrevokesessions'
    $params = @{
        tenantFilter = $CustomerTenantID
        ID           = $UserID
        UserName     = $UserName

    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
