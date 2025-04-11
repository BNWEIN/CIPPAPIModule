<#
.SYNOPSIS
Removes an Exchange transport rule.

.DESCRIPTION
The Remove-CIPPTransportRule function removes a specified transport rule from Exchange in CIPP.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER RuleGuid
Specifies the GUID of the transport rule to remove.

.EXAMPLE
Remove-CIPPTransportRule -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -RuleGuid "98765432-4321-4321-4321-BA0987654321"
Removes the specified transport rule from the specified tenant.

.NOTES
Requires appropriate permissions to manage Exchange transport rules.
#>

function Remove-CIPPTransportRule {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true)]
        [guid]$RuleGuid
    )

    Write-Verbose "Removing transport rule $RuleGuid from tenant $CustomerTenantID"

    $endpoint = '/api/RemoveTransportRule'
    $body = @{
        tenantFilter = $CustomerTenantID
        guid         = $RuleGuid
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}