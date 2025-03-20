<#
.SYNOPSIS
Retrieves sign-in logs for a specific user in the CIPP system.

.DESCRIPTION
The Get-CIPPUserSignIns function retrieves the sign-in logs for a specific user in the CIPP system. It requires the customer tenant ID and the user ID as mandatory parameters.

.PARAMETER CustomerTenantID
The customer tenant ID associated with the user.

.PARAMETER UserID
The unique identifier of the user.

.EXAMPLE
Get-CIPPUserSignIns -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc"
This example retrieves the sign-in logs for the user with the customer tenant ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" and the user ID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc".

#>

function Get-CIPPUserSignIns {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [guid]$UserID
    )

    Write-Verbose "Getting sign-in logs for User $userID"

    $endpoint = '/api/listusersigninlogs'
    $params = @{
        tenantFilter = $CustomerTenantID
        userId       = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
