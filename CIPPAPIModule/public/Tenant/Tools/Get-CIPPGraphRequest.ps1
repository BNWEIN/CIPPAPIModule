<#
.SYNOPSIS
    Retrieves graph data from a specified endpoint for a given tenant.

.DESCRIPTION
    The Get-CIPPGraphRequest function queries a specified Graph endpoint for a specific tenant and retrieves the graph data. It supports various optional parameters for customization.

.PARAMETER CustomerTenantId
    Specifies the ID of the customer tenant for which the graph data is requested. This parameter is mandatory.

.PARAMETER GraphEndPoint
    Specifies the endpoint URL of the Graph API. This parameter is mandatory.

.PARAMETER count
    Specifies whether to include the count of items in the response. This parameter is optional.

.PARAMETER Select
    Specifies the properties to include in the response. This parameter is optional.

.PARAMETER DisablePagination
    Specifies whether to disable pagination in the response. This parameter is optional.

.PARAMETER Top
    Specifies the maximum number of items to include in the response. This parameter is optional.

.PARAMETER Format
    Specifies the format of the response. This parameter is optional.

.PARAMETER Filter
    Specifies the filter to apply to the response. This parameter is optional.

.PARAMETER Expand
    Specifies the properties to expand in the response. This parameter is optional.

.PARAMETER Search
    Specifies the search query to apply to the response. This parameter is optional.

.PARAMETER ReverseTenantLookupProperty
    Specifies the property to use for reverse tenant lookup. This parameter is optional.

.EXAMPLE
    Get-CIPPGraphRequest -CustomerTenantId "contoso.onmicrosoft.com" -GraphEndPoint "users" -Select "displayName,mail" -DisablePagination $true -Top 10

    Retrieves graph data from the specified endpoint for the tenant with ID "contoso.onmicrosoft.com". The response includes only the "displayName" and "mail" properties, disables pagination, and includes a maximum of 10 items in the response.

#>
function Get-CIPPGraphRequest {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantId,
        [Parameter(Mandatory = $true)]
        [string]$GraphEndPoint,
        [Parameter(Mandatory = $false)]
        [bool]$count,
        [Parameter(Mandatory = $false)]
        [string]$Select,
        [Parameter(Mandatory = $false)]
        [bool]$DisablePagination,
        [Parameter(Mandatory = $false)]
        [string]$Top,
        [Parameter(Mandatory = $false)]
        [string]$Format,
        [Parameter(Mandatory = $false)]
        [string]$Filter,
        [Parameter(Mandatory = $false)]
        [string]$Expand,
        [Parameter(Mandatory = $false)]
        [string]$Search,
        [Parameter(Mandatory = $false)]
        [string]$ReverseTenantLookupProperty
    )

    Write-Verbose "Querying Graph Endpoint $EndPoint for tenant $CustomerTenantId"
    $endpoint = '/api/ListGraphRequest'
    $params = [ordered]@{
        tenantFilter = $CustomerTenantID
        endpoint     = $GraphEndPoint
    }

    $optionalParams = @{
        '$count'                      = if ($count -eq $true) { 'true' } else { $null }
        '$select'                     = $Select
        'NoPagination'                = if ($DisablePagination) { 'true' } else { 'false' }
        '$top'                        = $Top
        '$format'                     = $Format
        '$filter'                     = $Filter
        '$expand'                     = $Expand
        '$search'                     = $Search
        'reverseTenantLookupProperty' = $ReverseTenantLookupProperty
    }

    foreach ($key in $optionalParams.Keys) {
        if ($null -ne $optionalParams[$key]) {
            $params[$key] = $optionalParams[$key]
        }
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}