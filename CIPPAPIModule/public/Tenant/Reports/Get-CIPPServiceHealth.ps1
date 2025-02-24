<#
.SYNOPSIS
Gets service health information.

.DESCRIPTION
The Get-CIPPServiceHealth function retrieves active service health issues from CIPP.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. Use 'AllTenants' to get health information for all tenants, or use the AllTenants switch parameter.

.PARAMETER AllTenants
When specified, retrieves service health information for all tenants.

.PARAMETER DisplayName
When querying a specific tenant, specifies the display name of the tenant. Required when CustomerTenantID is not 'AllTenants'.

.PARAMETER DefaultDomainName
When querying a specific tenant, specifies the default domain name of the tenant. Required when CustomerTenantID is not 'AllTenants'.

.EXAMPLE
Get-CIPPServiceHealth -CustomerTenantID "AllTenants"
Returns active service health issues for all tenants.

.EXAMPLE
Get-CIPPServiceHealth -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -DisplayName "Contoso" -DefaultDomainName "contoso.onmicrosoft.com"
Returns active service health issues for the specified tenant.

.NOTES
Requires Tenant.Administration.Read permissions.
Only returns active issues (where endDateTime is null).
#>

function Get-CIPPServiceHealth {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $false)]
        [switch]$AllTenants,

        [Parameter(Mandatory = $false)]
        [string]$DisplayName,

        [Parameter(Mandatory = $false)]
        [string]$DefaultDomainName
    )

    if ($AllTenants.IsPresent -eq $true) {
        $CustomerTenantID = 'AllTenants'
    }

    Write-Verbose "Getting service health information for tenant $CustomerTenantID"
    if ($CustomerTenantID -ne 'AllTenants' -and (-not $DisplayName -or -not $DefaultDomainName)) {
        throw 'DisplayName and DefaultDomainName are required when querying a specific tenant'
    }

    $endpoint = '/api/ListServiceHealth'
    $params = @{
        tenantFilter      = $CustomerTenantID
        displayName       = $DisplayName
        defaultDomainName = $DefaultDomainName
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}