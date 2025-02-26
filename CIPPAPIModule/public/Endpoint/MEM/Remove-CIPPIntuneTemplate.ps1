<#
.SYNOPSIS
Removes an Intune template.

.DESCRIPTION
The Remove-CIPPIntuneTemplate function removes a specified Intune template from CIPP.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER TemplateId
Specifies the ID of the Intune template to remove.

.EXAMPLE
Remove-CIPPIntuneTemplate -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -TemplateId "98765432-4321-4321-4321-BA0987654321"
Removes the specified Intune template from the specified tenant.

.NOTES
Requires appropriate permissions to manage Intune templates.
#>

function Remove-CIPPIntuneTemplate {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true)]
        [string]$TemplateId
    )

    Write-Verbose "Removing Intune template $TemplateId from tenant $CustomerTenantID"

    $endpoint = '/api/RemoveIntuneTemplate'
    $body = @{
        tenantFilter = $CustomerTenantID
        ID           = $TemplateId
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}