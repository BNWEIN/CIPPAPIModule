<#
.SYNOPSIS
Removes a group template.

.DESCRIPTION
The Remove-CIPPGroupTemplate function removes a specified group template from CIPP.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER TemplateId
Specifies the ID of the group template to remove.

.EXAMPLE
Remove-CIPPGroupTemplate -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -TemplateId "98765432-4321-4321-4321-BA0987654321"
Removes the specified group template from the specified tenant.

.NOTES
Requires appropriate permissions to manage group templates.
#>

function Remove-CIPPGroupTemplate {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true)]
        [string]$TemplateId
    )

    Write-Verbose "Removing group template $TemplateId from tenant $CustomerTenantID"

    $endpoint = '/api/RemoveGroupTemplate'
    $body = @{
        tenantFilter = $CustomerTenantID
        ID           = $TemplateId
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}