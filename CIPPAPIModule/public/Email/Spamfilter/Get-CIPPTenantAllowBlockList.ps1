<#
.SYNOPSIS
Gets tenant allow/block list items.

.DESCRIPTION
The Get-CIPPTenantAllowBlockList function retrieves all allow/block list items for a tenant, including senders, URLs, and file hashes.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.EXAMPLE
Get-CIPPTenantAllowBlockList -CustomerTenantID "12345678-1234-1234-1234-1234567890AB"
Returns all allow/block list entries (senders, URLs, and file hashes) for the specified tenant.

.NOTES
Requires Exchange.SpamFilter.Read permissions.
Returns items for three list types:
- Sender: Email addresses and domains
- Url: Web addresses
- FileHash: File hashes for malware detection
#>

function Get-CIPPTenantAllowBlockList {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting tenant allow/block list items for tenant $CustomerTenantID"

    $endpoint = '/api/ListTenantAllowBlockList'
    $params = @{
        tenantFilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}