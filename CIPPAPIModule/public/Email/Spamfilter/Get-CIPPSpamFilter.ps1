<#
.SYNOPSIS
Retrieves the spam filter settings for a specified customer tenant ID.

.DESCRIPTION
The Get-CIPPSpamFilter function retrieves the spam filter settings for a specified customer tenant ID using the CIPP API. It sends a request to the "/api/listspamfilter" endpoint with the provided tenant ID as a filter parameter.

.PARAMETER CustomerTenantID
The customer tenant ID for which to retrieve the spam filter settings. This parameter is mandatory.

.EXAMPLE
Get-CIPPSpamFilter -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves the spam filter settings for the customer tenant with the ID "contoso.onmicrosoft.com".

#>
function Get-CIPPSpamFilter {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting spam filter settings for $CustomerTenantID"
    $endpoint = '/api/listspamfilter'
    $params = @{
        tenantFilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
