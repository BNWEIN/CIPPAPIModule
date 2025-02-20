<#
.SYNOPSIS
Removes a BPA (Best Practice Analyzer) template.

.DESCRIPTION
The Remove-CIPPBPATemplate function removes a specified BPA template from CIPP.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER TemplateId
Specifies the ID of the BPA template to remove.

.EXAMPLE
Remove-CIPPBPATemplate -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -TemplateId "98765432-4321-4321-4321-BA0987654321"
Removes the specified BPA template from the specified tenant.

.NOTES
Requires appropriate permissions to manage BPA templates.
#>

function Remove-CIPPBPATemplate {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true)]
        [string]$TemplateId
    )

    Write-Verbose "Removing BPA template $TemplateId from tenant $CustomerTenantID"

    $endpoint = '/api/RemoveBPATemplate'
    $body = @{
        tenantFilter = $CustomerTenantID
        TemplateName = $TemplateId
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}