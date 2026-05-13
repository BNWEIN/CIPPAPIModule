<#
.SYNOPSIS
    Performs necessary checks before making CIPP API calls.

.DESCRIPTION
    The Invoke-CIPPPreFlightCheck function validates that all required CIPP API connection 
    variables are set and ensures the authentication token is valid.

    If the authentication token is missing or expired, it automatically attempts to reconnect 
    to the CIPP API using the stored credentials.
    
    This function is called before every API operation to ensure proper connectivity and 
    token validity. Module update checks are performed during initialization via Set-CIPPAPIDetails.

.EXAMPLE
    Invoke-CIPPPreFlightCheck
    
    Performs credential validation and token refresh checks.
    
.NOTES
    This function requires that Set-CIPPAPIDetails has been previously run to set up the 
    connection information (ClientID, ClientSecret, APIURL, and TenantID).
    
    An error will be thrown if required connection variables are missing.

.OUTPUTS
    None. This function does not generate any output.
#>
function Invoke-CIPPPreFlightCheck {
    [CmdletBinding()]
    param ()
    if ($null -eq $Script:CIPPClientID -or 
        $null -eq $Script:CIPPClientSecret -or 
        $null -eq $Script:CIPPAPIUrl -or 
        $null -eq $Script:TenantID) {
        throw 'Cannot continue: CIPP API information not found. Please run Set-CIPPAPIDetails before connecting to the API.'
        break
    }

    # Check token expiry and refresh if needed
    Get-TokenExpiry
    if ((-not $Script:ExpiryDateTime) -or ($script:ExpiryDateTime -lt (Get-Date))) {
        Write-Verbose 'Token expired or not found. Connecting to CIPP'
        $request = @{
            CIPPClientID     = $script:CIPPClientID
            CIPPClientSecret = $script:CIPPClientSecret
            CIPPAPIUrl       = $script:CIPPAPIUrl
            TenantID         = $script:TenantID
        }

        Connect-CIPP @request
    }
}