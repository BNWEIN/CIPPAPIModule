<#
.SYNOPSIS
Retrieves the Conditional Access (CA) policies for a specific user in a customer's tenant.

.DESCRIPTION
The Get-CIPPUserCAPolicies function retrieves the Conditional Access (CA) policies for a specific user in a customer's tenant. It makes use of the Invoke-CIPPRestMethod function to send a request to the API endpoint "/api/listuserconditionalaccesspolicies" and returns the response.

.PARAMETER CustomerTenantID
The ID of the customer's tenant.

.PARAMETER UserID
The ID of the user for whom the CA policies are to be retrieved.

.EXAMPLE
Get-CIPPUserCAPolicies -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "user1@dom.com"
This example retrieves the CA policies for the user with the ID "user1@domain.com" in the customer's tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>

function Get-CIPPUserCAPolicies {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID
    )
    
    Write-Verbose "Getting user CA Policies $CustomerTenantID"
    
    $endpoint = "/api/listuserconditionalaccesspolicies"
    $params = @{
        tenantfilter = $CustomerTenantID
        userId = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
