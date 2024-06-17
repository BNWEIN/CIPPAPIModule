<#
.SYNOPSIS
    Invokes the pre-flight check before connecting to the CIPP API.

.DESCRIPTION
    This function performs a pre-flight check before connecting to the CIPP API. It checks if the required CIPP API information is available and if the token has expired. If the information is not found or the token has expired, it connects to the CIPP API using the provided credentials.

.PARAMETER None
    This function does not accept any parameters.

.EXAMPLE
    Invoke-CIPPPreFlightCheck

#>
function Invoke-CIPPPreFlightCheck {
    [CmdletBinding()]
    param ()
    if ($null -eq $Script:CIPPClientID -or 
    $null -eq $Script:CIPPClientSecret -or 
    $null -eq $Script:CIPPAPIUrl -or 
    $null -eq $Script:TenantID) {
        throw "Cannot continue: CIPP API information not found. Please run Set-CIPPAPIDetails before connecting to the API."
        break
    }
    Get-TokenExpiry
    if ((-not $Script:ExpiryDateTime) -or ($script:ExpiryDateTime -lt (Get-Date))) {
        write-Verbose "Token expired or not found. Connecting to CIPP"
        $request = @{
            CIPPClientID = $script:CIPPClientID
            CIPPClientSecret = $script:CIPPClientSecret
            CIPPAPIUrl = $script:CIPPAPIUrl
            TenantID = $TenantID
        }

        Connect-CIPP @request
    }
}