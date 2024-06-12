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

