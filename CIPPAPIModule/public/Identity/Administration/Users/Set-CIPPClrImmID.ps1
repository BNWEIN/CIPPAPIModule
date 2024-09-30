<#
.SYNOPSIS
Clears the Immutable ID for a user.

.DESCRIPTION
The Set-CIPPClrImmID function clears the Immutable ID for a user by invoking a REST API endpoint.

.PARAMETER CustomerTenantID
The ID of the customer tenant.

.PARAMETER UserID
The ID of the user.

.EXAMPLE
Set-CIPPClrImmID -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc"

This example clears the Immutable ID for the user with the specified CustomerTenantID and UserID.

#>

function Set-CIPPClrImmID {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [guid]$UserID
    )

    Write-Verbose "Clearing Immutable ID for User: $userID"

    $endpoint = '/api/execclrimmid'
    $params = @{
        tenantfilter = $CustomerTenantID
        Id           = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
