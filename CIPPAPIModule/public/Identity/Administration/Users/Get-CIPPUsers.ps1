<#
.SYNOPSIS
Retrieves user information from the CIPP API.

.DESCRIPTION
The Get-CIPPUsers function is used to retrieve user information from the CIPP API. It can retrieve all users for a specific tenant or retrieve details for a specific user.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant for which to retrieve user information. This parameter is mandatory.

.PARAMETER UserID
Specifies the ID of the user for which to retrieve details. This parameter is optional.

.EXAMPLE
Get-CIPPUsers -CustomerTenantID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc"
Retrieves all users for the tenant with ID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc".

.EXAMPLE
Get-CIPPUsers -CustomerTenantID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc" -UserID "user@domain.com"
Retrieves details for the user with ID "user@domain.com" in the tenant with ID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc".
#>
function Get-CIPPUsers {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [string]$UserID
    )

    if (-not $UserID) {
        Write-Verbose "Getting all users for tenant $CustomerTenantID"
    } else {
        Write-Verbose "Getting user details for user $UserID"
    }
    $endpoint = '/api/Listusers'
    $params = @{
        tenantFilter = $CustomerTenantID
        userId       = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
