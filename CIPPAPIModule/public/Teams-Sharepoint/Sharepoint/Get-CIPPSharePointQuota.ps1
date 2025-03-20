<#
.SYNOPSIS
Retrieves the SharePoint quota for a specific customer tenant.

.DESCRIPTION
The Get-CIPPSharePointQuota function retrieves the SharePoint quota for a specific customer tenant by making a REST API call to the "/api/listsharepointquota" endpoint.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which the SharePoint quota needs to be retrieved.

.EXAMPLE
Get-CIPPSharePointQuota -CustomerTenantID "contoso.onmicrosoft.com"
This example retrieves the SharePoint quota for the customer tenant with the ID "contoso.onmicrosoft.com".

.EXAMPLE
Get-CIPPSharePointQuota -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
This example retrieves the SharePoint quota for the customer tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
function Get-CIPPSharePointQuota {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting SharePoint quota for $CustomerTenantID"
    $endpoint = '/api/listsharepointquota'
    $params = @{
        tenantFilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
