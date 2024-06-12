<#
    .SYNOPSIS
        Calculates and returns the expiry date/time of a Microsoft token.
    .DESCRIPTION
        Takes the expires in time for an auth token and returns a PowerShell date/time object containing the expiry date/time of the token.
    .OUTPUTS
        A powershell date/time object representing the token expiry.
    #>
function Get-TokenExpiry {
    [CmdletBinding()]
    [OutputType([DateTime])]
    param (
        [Parameter(Mandatory = $false)]
        [int64]$ExpiresIn = $script:ExpiresIn
    )
    if ($script:ExpiresIn -eq $null) {
        return
    } else {
        $Script:ExpiryDateTime = $script:TokenAcquiredTime.AddSeconds($script:ExpiresIn)
        Write-Verbose "Calcuated token expiry as $Script:ExpiryDateTime"
    }
}