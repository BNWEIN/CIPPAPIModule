function Get-CIPPExecAPIPermissionsList {
    [CmdletBinding()]
        Param()

    Write-Verbose "Getting CIPP Logs"
    $endpoint = "/api/ExecAPIPermissionList"
    
    Invoke-CIPPRestMethod -Endpoint $endpoint
}

