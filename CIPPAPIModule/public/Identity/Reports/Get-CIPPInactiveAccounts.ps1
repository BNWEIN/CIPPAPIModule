<#
.SYNOPSIS
Retrieves a list of inactive accounts for a specific customer.

.DESCRIPTION
The Get-CIPPInactiveAccounts function retrieves a list of inactive accounts for a specific customer based on the provided CustomerTenantID.

.PARAMETER CustomerTenantID
Specifies the ID of the customer's tenant for which to retrieve the inactive accounts.

.EXAMPLE
Get-CIPPInactiveAccounts -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves the list of inactive accounts for the customer with the tenant ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".


#>
function Get-CIPPInactiveAccounts {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Getting inactive accounts for customer: $CustomerTenantID"
    $endpoint = '/api/listinactiveaccounts'
    $params = @{
        tenantFilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
