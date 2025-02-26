function ConvertTo-UnixTime {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, Position = 0)]
        [datetime]$DateTime
    )
    
    $unixEpoch = [DateTime]::new(1970, 1, 1, 0, 0, 0, [DateTimeKind]::Utc)
    $unixTime = ([int64]($DateTime.ToUniversalTime() - $unixEpoch).TotalSeconds)
    return $unixTime
}