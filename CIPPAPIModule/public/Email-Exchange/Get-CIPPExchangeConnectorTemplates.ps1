<#
.SYNOPSIS
Retrieves the Exchange Connector Templates.

.DESCRIPTION
The Get-CIPPExchangeConnectorTemplates function retrieves the Exchange Connector Templates by making a REST API call to the specified endpoint.

.PARAMETER None
This function does not accept any parameters.

.EXAMPLE
Get-CIPPExchangeConnectorTemplates
This example demonstrates how to use the Get-CIPPExchangeConnectorTemplates function to retrieve the Exchange Connector Templates.

#>

function Get-CIPPExchangeConnectorTemplates {
    [CmdletBinding()]
    Param()

    Write-Verbose "Getting Exchange Connectors Templates"
    $endpoint = "/api/listexconnectortemplates"
    
    Invoke-CIPPRestMethod -Endpoint $endpoint
}
