<#
.SYNOPSIS
Retrieves audit log searches for a specific customer.

.DESCRIPTION
The Get-CIPPAuditLogSearches function retrieves audit log searches for a specific customer identified by their tenant ID.

.PARAMETER CustomerTenantID
The tenant ID of the customer for whom to retrieve the audit log searches.

.PARAMETER SearchId
The ID of the search to retrieve results for.

.PARAMETER Days
The number of days to retrieve audit log searches for.

.PARAMETER Type
The type of search to perform (e.g., 'Searches', 'SearchResults').

.EXAMPLE
Get-CIPPAuditLogSearches -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -Type "Searches"
Retrieves the audit log searches for the customer with the tenant ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.EXAMPLE
Get-CIPPAuditLogSearches -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -SearchId "12345" -Type "SearchResults"
Retrieves the results of the audit log search with ID "12345" for the customer with the tenant ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.NOTES
Requires appropriate permissions to access audit log information.
#>

function Get-CIPPAuditLogSearches {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $false)]
        [string]$SearchId,

        [Parameter(Mandatory = $false)]
        [int]$Days,

        [Parameter(Mandatory = $false)]
        [string]$Type
    )

    Write-Verbose "Getting Audit Log Searches for customer: $CustomerTenantID"
    $endpoint = '/api/ListAuditLogSearches'
    $params = @{
        tenantFilter = $CustomerTenantID
        SearchId     = $SearchId
        Days         = $Days
        Type         = $Type
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}