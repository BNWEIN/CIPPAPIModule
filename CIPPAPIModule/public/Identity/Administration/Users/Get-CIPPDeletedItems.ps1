<#
.SYNOPSIS
Retrieves the deleted items for a specific customer tenant.

.DESCRIPTION
The Get-CIPPDeletedItems function retrieves the deleted items for a specific customer tenant by making a REST API call to the "/api/listdeleteditems" endpoint.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to retrieve the deleted items.

.EXAMPLE
Get-CIPPDeletedItems -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves the deleted items for the customer tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
function Get-CIPPDeletedItems {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting deleted items for $CustomerTenantID"

    $endpoint = "/api/listdeleteditems"
    $params = @{
        tenantfilter = $CustomerTenantID
        userId = $UserID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
