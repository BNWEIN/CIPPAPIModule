<#
.SYNOPSIS
    Retrieves Exchange Transport Rule Templates.

.DESCRIPTION
    The Get-CIPPExchangeTransportRuleTemplates function calls the CIPP API to retrieve a list of Exchange Transport Rule Templates.

.PARAMETER None
    This function does not take any parameters.

.EXAMPLE
    Get-CIPPExchangeTransportRuleTemplates
    This example retrieves the Exchange Transport Rule Templates using the CIPP API.
#>
function Get-CIPPExchangeTransportRuleTemplates {
    [CmdletBinding()]
    Param()

    Write-Verbose 'Getting Exchange Transport Rules Templates'
    $endpoint = '/api/ListTransportRulesTemplates'
    
    Invoke-CIPPRestMethod -Endpoint $endpoint
}
