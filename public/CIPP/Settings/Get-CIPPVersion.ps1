function Get-CIPPVersion {
    [CmdletBinding()]
        Param()

    Write-Verbose "Getting CIPP Version"
    $endpoint = "/api/Getversion"
    
    Invoke-CIPPRestMethod -Endpoint $endpoint
}

