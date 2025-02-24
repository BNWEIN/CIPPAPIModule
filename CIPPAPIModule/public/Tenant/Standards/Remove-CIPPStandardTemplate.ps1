<#
.SYNOPSIS
Removes a standards template.

.DESCRIPTION
The Remove-CIPPStandardTemplate function removes a specified standards template from CIPP.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER TemplateId
Specifies the ID of the standards template to remove.

.EXAMPLE
Remove-CIPPStandardTemplate -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -TemplateId "98765432-4321-4321-4321-BA0987654321"
Removes the specified standards template from the specified tenant.

.NOTES
Requires appropriate permissions to manage tenant standards templates.
#>

function Remove-CIPPStandardTemplate {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$TemplateId
    )

    Write-Verbose "Removing standards template $TemplateId from tenant $CustomerTenantID"

    $endpoint = '/api/RemoveStandardTemplate'
    $body = @{
        ID = $TemplateId
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method Post
}