<#
.SYNOPSIS
    Retrieves the per-user Multi-Factor Authentication (MFA) status for a specified user or all users in a given customer tenant.

.PARAMETER CustomerTenantID
    The ID of the customer tenant for which to retrieve the per-user MFA status. This parameter is mandatory.

.PARAMETER UserId
    The ID of the user for whom to retrieve the per-user MFA status. This parameter is optional and is ignored if the AllUsers switch is specified.
    Can be either the user's email address or the user's ID.

.PARAMETER AllUsers
    A switch parameter that, when specified, retrieves the per-user MFA status for all users in the specified customer tenant. If this switch is specified, the UserId parameter is ignored.

.EXAMPLE
    Get-CIPPPerUserMFA -CustomerTenantID "12345" -UserId "user@example.com"
    Retrieves the per-user MFA status for the user with ID "user@example.com" in the customer tenant with ID "12345".

.EXAMPLE
    Get-CIPPPerUserMFA -CustomerTenantID "12345" -AllUsers
    Retrieves the per-user MFA status for all users in the customer tenant with ID "12345".

.NOTES
    This function uses the Invoke-CIPPRestMethod cmdlet to make a GET request to the '/api/ListPerUserMFA' endpoint with the specified parameters.
#>
function Get-CIPPPerUserMFA {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [string]$UserId,
        [Parameter(Mandatory = $false)]
        [switch]$AllUsers
    )

    if ($AllUsers.IsPresent -eq $true) {
        Write-Verbose "Getting Per user MFA for all users in $CustomerTenantID"
    } else {
        Write-Verbose "Getting Per user MFA for $UserId in $CustomerTenantID"
    }

    $endpoint = '/api/ListPerUserMFA'
    $params = @{
        tenantFilter = $CustomerTenantID
        userId       = $UserId
        allUsers     = $AllUsers.IsPresent
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}