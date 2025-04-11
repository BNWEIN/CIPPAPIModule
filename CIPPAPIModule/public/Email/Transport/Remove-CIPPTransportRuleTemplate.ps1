<#
.SYNOPSIS
Removes a transport rule template.

.DESCRIPTION
The Remove-CIPPTransportRuleTemplate function removes a specified transport rule template from CIPP.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER TemplateId
Specifies the ID of the transport rule template to remove.

.EXAMPLE
Remove-CIPPTransportRuleTemplate -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -TemplateId "98765432-4321-4321-4321-BA0987654321"
Removes the specified transport rule template from the specified tenant.

.NOTES
Requires appropriate permissions to manage Exchange transport rule templates.
#>

function Remove-CIPPTransportRuleTemplate {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true)]
        [string]$TemplateId
    )

    Write-Verbose "Removing transport rule template $TemplateId from tenant $CustomerTenantID"

    $endpoint = '/api/RemoveTransportRuleTemplate'
    $body = @{
        tenantFilter = $CustomerTenantID
        ID           = $TemplateId
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}