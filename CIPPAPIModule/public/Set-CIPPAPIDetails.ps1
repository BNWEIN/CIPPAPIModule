<#
.SYNOPSIS
    Sets the CIPP API connection details and validates the module version.

.DESCRIPTION
    The Set-CIPPAPIDetails function is used to configure the CIPP API connection details, 
    including the client ID, client secret, API URL, and tenant ID. These credentials are 
    stored in script-scoped variables for use by all subsequent API operations.
    
    This function also performs a module update check during initialization to alert users 
    if a newer version of CIPPAPIModule is available on the PowerShell Gallery. This check 
    occurs once during setup rather than on every API call for optimal performance.

.PARAMETER CIPPClientID
    Specifies the client ID for the CIPP API application registration.

.PARAMETER CIPPClientSecret
    Specifies the client secret for the CIPP API application registration.

.PARAMETER CIPPAPIUrl
    Specifies the base URL for the CIPP API endpoint.

.PARAMETER TenantID
    Specifies the Azure AD tenant ID used for OAuth authentication.

.PARAMETER SkipVersionCheck
    When specified, bypasses the module update check during initialization. Use this 
    parameter in automated scenarios where version checking should be deferred or skipped.

.EXAMPLE
    Set-CIPPAPIDetails -CIPPClientID "d8d41058-97df-4b80-8e1b-7083d756409f" -CIPPClientSecret "YourSecurePassword" -CIPPAPIUrl "https://api.cipp.com" -TenantID "7c2f78c0-554e-4f42-a663-c4df3ce7f51f"

    This example sets the CIPP API details with version checking enabled.

.EXAMPLE
    Set-CIPPAPIDetails -CIPPClientID "d8d41058-97df-4b80-8e1b-7083d756409f" -CIPPClientSecret "YourSecurePassword" -CIPPAPIUrl "https://api.cipp.com" -TenantID "7c2f78c0-554e-4f42-a663-c4df3ce7f51f" -SkipVersionCheck

    This example sets the CIPP API details while skipping the module version check.

.NOTES
    After running this function, you can use other CIPPAPIModule functions to interact 
    with the CIPP API. The credentials are stored in the current PowerShell session and 
    will be lost when the session is closed.
#>
function Set-CIPPAPIDetails {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$CIPPClientID,
        [Parameter(Mandatory = $true)]
        [String]$CIPPClientSecret,
        [Parameter(Mandatory = $true)]
        [String]$CIPPAPIUrl,
        [Parameter(Mandatory = $true)]
        [String]$TenantID,
        [switch]$SkipVersionCheck
    )
    
    if ($SkipVersionCheck.IsPresent -eq $false) {
        Test-CIPPAPIModuleUpdate
    }

    Write-Verbose 'Setting CIPP API Keys'
    $script:CIPPClientID = $CIPPClientID
    $script:CIPPClientSecret = $CIPPClientSecret
    $script:CIPPAPIUrl = $CIPPAPIUrl
    $script:TenantID = $TenantID
}