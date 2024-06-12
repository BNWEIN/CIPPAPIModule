function Get-CIPPLogs {
    [CmdletBinding()]
        Param()

    Write-Verbose "Getting CIPP Logs"
    $endpoint = "/api/ListLogs"
    
    Invoke-CIPPRestMethod -Endpoint $endpoint
}

