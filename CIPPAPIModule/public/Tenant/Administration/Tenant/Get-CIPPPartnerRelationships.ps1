<#
.SYNOPSIS
Retrieves partner relationships for a specified customer tenant.

.DESCRIPTION
The Get-CIPPPartnerRelationships function retrieves partner relationships for a specified customer tenant by making a REST API call to the "/api/listpartnerrelationships" endpoint.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to retrieve partner relationships.

.EXAMPLE
Get-CIPPPartnerRelationships -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves partner relationships for the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.EXAMPLE
Get-CIPPPartnerRelationships -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves partner relationships for the customer tenant with ID "contoso.onmicrosoft.com".

#>
function Get-CIPPPartnerRelationships {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Getting org $CustomerTenantID"
    $endpoint = "/api/listpartnerrelationships"
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
