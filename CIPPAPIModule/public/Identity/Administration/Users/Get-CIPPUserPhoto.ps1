<#
.SYNOPSIS
Retrieves the photo of a user from the CIPP API.

.DESCRIPTION
The Get-CIPPUserPhoto function is used to retrieve the photo of a user from the CIPP API. It sends a request to the API endpoint "/api/listuserphoto" with the specified customer tenant ID and user ID.

.PARAMETER CustomerTenantID
The customer tenant ID associated with the user.

.PARAMETER UserID
The ID of the user whose photo needs to be retrieved.

.EXAMPLE
Get-CIPPUserPhoto -CustomerTenantID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc" -UserID "user@domain.com"

This example retrieves the photo of the user with the ID "user@domain.com" from the customer tenant with the ID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc".

#>

function Get-CIPPUserPhoto {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID
    )
    
    Write-Verbose "Getting user photo for $userID"
    
    $endpoint = '/api/listuserphoto'
    $params = @{
        tenantfilter = $CustomerTenantID
        userId       = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
