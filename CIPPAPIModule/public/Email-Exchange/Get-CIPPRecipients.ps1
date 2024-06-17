<#
.SYNOPSIS
Retrieves recipients for a specified customer tenant ID.

.DESCRIPTION
The Get-CIPPRecipients function retrieves recipients for a specified customer tenant ID by making a REST API call to the "/api/listrecipients" endpoint.

.PARAMETER CustomerTenantID
Specifies the customer tenant ID for which to retrieve recipients.

.EXAMPLE
Get-CIPPRecipients -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves recipients for the customer tenant ID "contoso.onmicrosoft.com".

#>
function Get-CIPPRecipients {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting recipients for $CustomerTenantID"
    $endpoint = "/api/listrecipients"
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
