<#
.SYNOPSIS
Removes a Connection Filter Template.

.DESCRIPTION
The Remove-CIPPConnectionFilterTemplate function removes a specified Connection Filter Template from CIPP.

.PARAMETER TemplateId
Specifies the ID of the Connection Filter Template to remove.

.EXAMPLE
Remove-CIPPConnectionFilterTemplate -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -TemplateId "98765432-4321-4321-4321-BA0987654321"
Removes the Connection Filter Template with the specified ID from the specified tenant.

.NOTES
Requires appropriate permissions to manage Exchange Connection Filter Templates.
#>

function Remove-CIPPConnectionFilterTemplate {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$TemplateId
    )

    Write-Verbose "Removing Connection Filter Template $TemplateId"

    $endpoint = '/api/RemoveConnectionfilterTemplate'
    $body = @{
        id = $TemplateId
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}