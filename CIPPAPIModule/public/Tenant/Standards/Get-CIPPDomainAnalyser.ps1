<#
.SYNOPSIS
Retrieves the list of domain analyzers for a specific customer tenant.

.DESCRIPTION
The Get-CIPPDomainAnalyser function retrieves the list of domain analyzers associated with a specific customer tenant. It makes a REST API call to retrieve the list of domain analyzers based on the provided customer tenant ID.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to retrieve the domain analyzers.

.EXAMPLE
Get-CIPPDomainAnalyser -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves the list of domain analyzers for the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
function Get-CIPPDomainAnalyser {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting Domain Analyser List for customer: $CustomerTenantID"
    $endpoint = '/api/ListDomainAnalyser'
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
