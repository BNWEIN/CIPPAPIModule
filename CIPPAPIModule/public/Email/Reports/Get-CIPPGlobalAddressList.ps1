<#
.SYNOPSIS
Gets Global Address List entries.

.DESCRIPTION
The Get-CIPPGlobalAddressList function retrieves all recipients from the Global Address List (GAL) in Exchange Online.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.EXAMPLE
Get-CIPPGlobalAddressList -CustomerTenantID "12345678-1234-1234-1234-1234567890AB"
Returns all recipients in the Global Address List for the specified tenant.

.NOTES
Requires Exchange.Mailbox.Read permissions.
Returns detailed recipient information including:
- Identity
- Display Name
- Alias
- Primary SMTP Address
- External Directory Object ID
- Hidden From Address Lists Status
- Email Addresses
- Directory Sync Status
- SKU Assignment
- Recipient Type Details
- Address List Membership
#>

function Get-CIPPGlobalAddressList {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting Global Address List for tenant $CustomerTenantID"

    $endpoint = '/api/ListGlobalAddressList'
    $params = @{
        tenantFilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}