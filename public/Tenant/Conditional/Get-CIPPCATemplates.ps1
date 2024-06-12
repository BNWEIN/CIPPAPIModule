function Get-CIPPCATemplates {
    [CmdletBinding()]
    Param()
    Write-Verbose "Getting Conditional Access Templates"
    $endpoint = "/api/listcatemplates"
    
    Invoke-CIPPRestMethod -Endpoint $endpoint
    
}

