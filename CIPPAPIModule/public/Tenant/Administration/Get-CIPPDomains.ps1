<#
.SYNOPSIS
Retrieves the domains for a specific customer.

.DESCRIPTION
The Get-CIPPDomains function retrieves the domains associated with a specific customer in the CIPP system.

.PARAMETER CustomerTenantID
The unique identifier of the customer's tenant.

.EXAMPLE
Get-CIPPDomains -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
This example retrieves the domains for the customer with the tenant ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>

Function Get-CIPPDomains {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting Domains for customer: $CustomerTenantID"
    
    # Define the endpoint and parameters
    $endpoint = "/api/ListDomains"
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    
    # Use the Invoke-CIPPRequest function to make the request
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}