<#
.SYNOPSIS
Retrieves spam filter templates from the CIPP API.

.DESCRIPTION
The Get-CIPPSpamFilterTemplates function retrieves spam filter templates from the CIPP API. It makes a REST API call to the "/api/listspamfiltertemplates" endpoint and returns the templates.

.PARAMETER TemplateID
Specifies the ID of the template to retrieve. This parameter is optional.

.EXAMPLE
Get-CIPPSpamFilterTemplates -TemplateID "12345"
Retrieves the spam filter template with the ID "12345" from the CIPP API.

#>
function Get-CIPPSpamFilterTemplates {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)]
        [string]$TemplateID
    )

    Write-Verbose 'Getting spam filter templates'
    $endpoint = '/api/listspamfiltertemplates'
    $params = @{
        id = $TemplateID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
