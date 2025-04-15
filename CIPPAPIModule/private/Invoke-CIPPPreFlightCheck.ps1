<#
.SYNOPSIS
    Performs necessary checks before making CIPP API calls.

.DESCRIPTION
    The Invoke-CIPPPreFlightCheck function validates that all required CIPP API connection 
    variables are set, checks for module updates, and ensures the authentication token is valid.

    If the authentication token is missing or expired, it automatically attempts to reconnect 
    to the CIPP API using the stored credentials.
    
    This function should be called before any API operation to ensure proper connectivity.

.PARAMETER SkipVersionCheck
    When specified, bypasses the check for module updates. This can be useful in automated scenarios
    or when you want to avoid the potential delay of version checking.

.EXAMPLE
    Invoke-CIPPPreFlightCheck
    
    Performs all pre-flight checks including module update verification.

.EXAMPLE
    Invoke-CIPPPreFlightCheck -SkipVersionCheck
    Performs pre-flight checks but skips checking for module updates.
    
.NOTES
    This function requires that Set-CIPPAPIDetails has been previously run to set up the 
    connection information (ClientID, ClientSecret, APIURL, and TenantID).
    
    An error will be thrown if required connection variables are missing.

.OUTPUTS
    None. This function does not generate any output.
#>
function Invoke-CIPPPreFlightCheck {
    [CmdletBinding()]
    param (
        [switch]$SkipVersionCheck
    )
    if ($null -eq $Script:CIPPClientID -or 
        $null -eq $Script:CIPPClientSecret -or 
        $null -eq $Script:CIPPAPIUrl -or 
        $null -eq $Script:TenantID) {
        throw 'Cannot continue: CIPP API information not found. Please run Set-CIPPAPIDetails before connecting to the API.'
        break
    }

    # Check for module updates
    if ($SkipVersionCheck.IsPresent -eq $false) {
        Test-CIPPAPIModuleUpdate
    }

    # Check token expiry
    Get-TokenExpiry
    if ((-not $Script:ExpiryDateTime) -or ($script:ExpiryDateTime -lt (Get-Date))) {
        Write-Verbose 'Token expired or not found. Connecting to CIPP'
        $request = @{
            CIPPClientID     = $script:CIPPClientID
            CIPPClientSecret = $script:CIPPClientSecret
            CIPPAPIUrl       = $script:CIPPAPIUrl
            TenantID         = $TenantID
        }

        Connect-CIPP @request
    }
}