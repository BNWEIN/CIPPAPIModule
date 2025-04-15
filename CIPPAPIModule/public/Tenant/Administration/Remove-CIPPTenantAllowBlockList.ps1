<#
.SYNOPSIS
Removes entries from a tenant's allow/block list.

.DESCRIPTION
The Remove-CIPPTenantAllowBlockList function removes specified entries from a tenant's allow/block list in CIPP.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER EntryId
Specifies the ID of the allow/block list entry to remove.

.EXAMPLE
Remove-CIPPTenantAllowBlockList -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -EntryId "98765432-4321-4321-4321-BA0987654321"
Removes the specified entry from the tenant's allow/block list.

.NOTES
Requires appropriate permissions to manage tenant allow/block lists.
#>

function Remove-CIPPTenantAllowBlockList {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true)]
        [string]$Entries,

        [Parameter(Mandatory = $true)]
        [ValidateSet('FileHash', 'Sender', 'URL', 'IP')]
        [string]$ListType
    )

    Write-Verbose "Removing allow/block list entries $Entries from tenant $CustomerTenantID"

    $endpoint = '/api/RemoveTenantAllowBlockList'
    $body = @{
        tenantFilter = $CustomerTenantID
        Entries      = $Entries
        ListType     = $ListType
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}