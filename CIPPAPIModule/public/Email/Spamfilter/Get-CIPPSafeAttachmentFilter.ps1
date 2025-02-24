<#
.SYNOPSIS
Gets safe attachments filter settings.

.DESCRIPTION
The Get-CIPPSafeAttachmentFilter function retrieves safe attachments policies and rules configured in Exchange Online for a tenant.
The output combines policy settings with their associated rules.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.EXAMPLE
Get-CIPPSafeAttachmentFilter -CustomerTenantID "12345678-1234-1234-1234-1234567890AB"
Returns all safe attachments policies and their associated rules for the specified tenant.

.NOTES
Requires Exchange.SpamFilter.Read permissions.
Each policy entry includes:
- All policy settings
- Associated rule name
- Rule priority
- Rule recipient domains
- Rule state
#>

function Get-CIPPSafeAttachmentFilter {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting safe attachments filter settings for tenant $CustomerTenantID"

    $endpoint = '/api/ListSafeAttachmentsFilters'
    $params = @{
        tenantFilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}