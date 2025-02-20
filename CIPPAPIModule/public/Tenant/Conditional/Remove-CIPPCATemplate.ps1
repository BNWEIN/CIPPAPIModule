<#
.SYNOPSIS
Removes a Conditional Access template.

.DESCRIPTION
The Remove-CIPPCATemplate function removes a specified Conditional Access template from CIPP.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER TemplateId
Specifies the ID of the Conditional Access template to remove.

.EXAMPLE
Remove-CIPPCATemplate -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -TemplateId "98765432-4321-4321-4321-BA0987654321"
Removes the specified Conditional Access template from the specified tenant.

.NOTES
Requires appropriate permissions to manage Conditional Access templates.
#>

function Remove-CIPPCATemplate {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true)]
        [string]$TemplateId
    )

    Write-Verbose "Removing Conditional Access template $TemplateId from tenant $CustomerTenantID"

    $endpoint = '/api/RemoveCATemplate'
    $body = @{
        tenantFilter = $CustomerTenantID
        ID           = $TemplateId
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}