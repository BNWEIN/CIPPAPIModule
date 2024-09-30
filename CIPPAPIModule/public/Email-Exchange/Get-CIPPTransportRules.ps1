<#
.SYNOPSIS
Retrieves transport rules for a specified customer tenant ID.

.DESCRIPTION
The Get-CIPPTransportRules function retrieves transport rules for a specified customer tenant ID using the CIPP API.

.PARAMETER CustomerTenantID
The unique identifier of the customer tenant for which to retrieve the transport rules.

.EXAMPLE
Get-CIPPTransportRules -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves the transport rules for the customer tenant with the ID "contoso.onmicrosoft.com".

#>
function Get-CIPPTransportRules {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting transport rules for $CustomerTenantID"
    $endpoint = '/api/listtransportrulestemplates'
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
