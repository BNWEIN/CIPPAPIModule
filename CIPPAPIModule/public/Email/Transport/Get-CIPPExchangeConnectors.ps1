<#
.SYNOPSIS
Retrieves Exchange Connectors for a specific customer.

.DESCRIPTION
The Get-CIPPExchangeConnectors function retrieves Exchange Connectors for a specific customer based on the provided CustomerTenantID.

.PARAMETER CustomerTenantID
Specifies the unique identifier of the customer's tenant.

.EXAMPLE
Get-CIPPExchangeConnectors -CustomerTenantID "Get-CIPPEnabledSharedMailboxes"
Retrieves the Exchange Connectors for the customer with the tenant ID "Get-CIPPEnabledSharedMailboxes".

#>

function Get-CIPPExchangeConnectors {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Getting Exchange Connectors for customer: $CustomerTenantID"
    $endpoint = '/api/listexchangeconnectors'
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
