function Get-CIPPBPATemplates {
    [CmdletBinding()]
        Param()
    
    Write-Verbose "Getting BPA Templates"
    $Endpoint = "/api/listbpatemplates"

    Invoke-CIPPRestMethod -Endpoint $Endpoint

}