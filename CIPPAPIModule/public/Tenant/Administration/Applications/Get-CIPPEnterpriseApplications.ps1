<#
.SYNOPSIS
Retrieves enterprise applications (service principals) for a tenant.

.DESCRIPTION
Calls the CIPP ListGraphRequest API to return service principals for a specified tenant. Defaults match the Enterprise Applications UI (selects key fields, includes counts, returns up to 999 results).

.PARAMETER CustomerTenantID
The ID of the customer tenant to query.

.EXAMPLE
Get-CIPPEnterpriseApplications -CustomerTenantID "contoso.onmicrosoft.com"
#>
function Get-CIPPEnterpriseApplications {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting enterprise applications for tenant: $CustomerTenantID"

    $endpoint = '/api/ListGraphRequest'
    $params = @{
        tenantFilter = $CustomerTenantID
        endpoint     = 'servicePrincipals'
        '$select'    = 'id,appId,displayName,createdDateTime,accountEnabled,homepage,publisherName,signInAudience,replyUrls,verifiedPublisher,info,api,appOwnerOrganizationId,tags,passwordCredentials,keyCredentials'
        '$top'       = 999
        '$count'     = 'true'
    }

    (Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params).Results
}
