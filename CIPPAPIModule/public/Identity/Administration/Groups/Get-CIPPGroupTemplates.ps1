<#
.SYNOPSIS
Retrieves group templates from the CIPP API.

.DESCRIPTION
The Get-CIPPGroupTemplates function retrieves group templates from the CIPP API. It can retrieve all group templates or a specific template based on the provided TemplateID.

.PARAMETER TemplateID
Specifies the ID of the group template to retrieve. If not provided, all group templates will be retrieved.

.EXAMPLE
Get-CIPPGroupTemplates -TemplateID "12345"
Retrieves the group template with the ID "12345" from the CIPP API.

.EXAMPLE
Get-CIPPGroupTemplates
Retrieves all group templates from the CIPP API.

#>

function Get-CIPPGroupTemplates {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)]
        [string]$TemplateID
    )

    if ($TemplateID) {
        Write-Verbose "Getting Group Template $TemplateID"
    } else {
        Write-Verbose "Getting all Group Templates"
    }

    $endpoint = "/api/ListGroupTemplates"
    $params = @{
        id = $TemplateID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
