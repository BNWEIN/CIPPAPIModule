<#
.SYNOPSIS
Removes an Exchange connector template.

.DESCRIPTION
The Remove-CIPPExConnectorTemplate function removes a specified Exchange connector template from CIPP.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER TemplateId
Specifies the ID of the Exchange connector template to remove.

.EXAMPLE
Remove-CIPPExConnectorTemplate -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -TemplateId "98765432-4321-4321-4321-BA0987654321"
Removes the specified Exchange connector template from the specified tenant.

.NOTES
Requires appropriate permissions to manage Exchange connector templates.
#>

function Remove-CIPPExConnectorTemplate {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true)]
        [string]$TemplateId
    )

    Write-Verbose "Removing Exchange connector template $TemplateId from tenant $CustomerTenantID"

    $endpoint = '/api/RemoveExConnectorTemplate'
    $body = @{
        tenantFilter = $CustomerTenantID
        ID           = $TemplateId
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}