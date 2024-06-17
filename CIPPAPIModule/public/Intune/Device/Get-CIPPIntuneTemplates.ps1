<#
.SYNOPSIS
Retrieves Intune templates.

.DESCRIPTION
The Get-CIPPIntuneTemplates function retrieves Intune templates using the CIPPRestMethod cmdlet.

.PARAMETER TemplateID
Specifies the ID of the template to retrieve. This parameter is optional.

.EXAMPLE
Get-CIPPIntuneTemplates -TemplateID "12345"
Retrieves the Intune template with the ID "12345".

#>
function Get-CIPPIntuneTemplates {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)]
        [string]$TemplateID
    )

    Write-Verbose "Getting Intune Templates"
    $endpoint = "/api/listintunetemplates"
    $params = @{
        tenantfilter = $CustomerTenantID
        id = $TemplateID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}