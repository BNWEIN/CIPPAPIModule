function Get-CIPPSpamFilterTemplates {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $false)]
            [string]$TemplateID
        )
    
    Write-Verbose "Getting spam filter templates"
    $endpoint = "/api/listspamfiltertemplates"
    $params = @{
        id = $TemplateID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

