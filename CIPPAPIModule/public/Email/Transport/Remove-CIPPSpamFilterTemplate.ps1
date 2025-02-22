<#
.SYNOPSIS
Removes a spam filter template.

.DESCRIPTION
The Remove-CIPPSpamFilterTemplate function removes a specified spam filter template from CIPP.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER TemplateId
Specifies the ID of the spam filter template to remove.

.EXAMPLE
Remove-CIPPSpamFilterTemplate -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -TemplateId "98765432-4321-4321-4321-BA0987654321"
Removes the specified spam filter template from the specified tenant.

.NOTES
Requires appropriate permissions to manage Exchange spam filter templates.
#>

function Remove-CIPPSpamFilterTemplate {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true)]
        [string]$TemplateId
    )

    Write-Verbose "Removing spam filter template $TemplateId from tenant $CustomerTenantID"

    $endpoint = '/api/RemoveSpamfilterTemplate'
    $body = @{
        tenantFilter = $CustomerTenantID
        ID           = $TemplateId
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method Post
}