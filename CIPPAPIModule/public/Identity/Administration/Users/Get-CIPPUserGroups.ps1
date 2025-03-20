<#
.SYNOPSIS
Retrieves the groups that a user belongs to.

.DESCRIPTION
The Get-CIPPUserGroups function retrieves the groups that a user belongs to based on the provided CustomerTenantID and UserID.

.PARAMETER CustomerTenantID
The ID of the customer tenant.

.PARAMETER UserID
The ID of the user.

.EXAMPLE
Get-CIPPUserGroups -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "user@domain.com"
Retrieves the groups that the user with the ID "user@domain.com" belongs to in the customer tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>

function Get-CIPPUserGroups {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID
    )
    
    Write-Verbose "Getting user groups for $userID"
    
    $endpoint = '/api/listusergroups'
    $params = @{
        tenantFilter = $CustomerTenantID
        userId       = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
