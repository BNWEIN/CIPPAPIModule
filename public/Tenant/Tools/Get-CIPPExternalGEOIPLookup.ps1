function Get-CIPPExternalGEOIPLookup {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [ValidatePattern('^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^((([0-9A-Fa-f]{1,4}:){7}([0-9A-Fa-f]{1,4}|:))|(([0-9A-Fa-f]{1,4}:){1,7}:)|(([0-9A-Fa-f]{1,4}:){1,6}:[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){1,5}(:[0-9A-Fa-f]{1,4}){1,2})|(([0-9A-Fa-f]{1,4}:){1,4}(:[0-9A-Fa-f]{1,4}){1,3})|(([0-9A-Fa-f]{1,4}:){1,3}(:[0-9A-Fa-f]{1,4}){1,4})|(([0-9A-Fa-f]{1,4}:){1,2}(:[0-9A-Fa-f]{1,4}){1,5})|(([0-9A-Fa-f]{1,4}:):(:[0-9A-Fa-f]{1,4}){1,6})|(::([0-9A-Fa-f]{1,4}:){1,7}))$')]
        [string]$IP
    )
   
    Write-Verbose "Looking up $ip in Geo DB"
    $endpoint = "/api/execgeoiplookup"
    $params = @{
        ip = $IP
    }
    
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}