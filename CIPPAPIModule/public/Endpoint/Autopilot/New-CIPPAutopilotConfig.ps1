<#
.SYNOPSIS
Creates a new Autopilot deployment profile configuration.

.DESCRIPTION
The New-CIPPAutopilotConfig function creates a new Autopilot deployment profile configuration for specified tenants.
It allows configuration of various deployment settings including user rights, deployment mode, and OOBE settings.

.PARAMETER CustomerTenantID
Array of tenant IDs where the Autopilot configuration should be applied.

.PARAMETER DisplayName
The name of the Autopilot configuration profile.

.PARAMETER Description
A description for the Autopilot configuration profile.

.PARAMETER NotLocalAdmin
If set to true, users will be standard users. If false, users will be administrators.

.PARAMETER SharedDevice
If set to true, the device will be configured for shared use. If false, it will be configured for single user.

.PARAMETER AssignTo
Optional. The assignment target for the profile.

.PARAMETER DeviceNameTemplate
Template for device naming pattern.

.PARAMETER AllowWhiteGlove
Enable or disable White Glove OOBE deployment.

.PARAMETER CollectHash
Enable or disable hardware hash collection.

.PARAMETER HideChangeAccount
Enable or disable the change account option in OOBE.

.PARAMETER HidePrivacy
Enable or disable privacy settings page in OOBE.

.PARAMETER HideTerms
Enable or disable terms of service page in OOBE.

.PARAMETER AutoKeyboard
Enable or disable automatic keyboard selection.

.PARAMETER Language
Language code for the deployment.

.EXAMPLE
New-CIPPAutopilotConfig -CustomerTenantID "contoso.onmicrosoft.com" -DisplayName "Standard Deployment" -Description "Default configuration" -DeviceNameTemplate "CTO-%SERIAL%" -Language "en-US"

.EXAMPLE
$params = @{
    CustomerTenantID = "contoso.onmicrosoft.com"
    DisplayName = "Shared Device Profile"
    Description = "Configuration for shared devices"
    NotLocalAdmin = $true
    SharedDevice = $true
    DeviceNameTemplate = "SHARED-%SERIAL%"
    HideChangeAccount = $true
    Language = "en-US"
}
New-CIPPAutopilotConfig @params

.NOTES
The function supports configuration of various OOBE (Out of Box Experience) settings and deployment options.
#>

function New-CIPPAutopilotConfig {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [array]$CustomerTenantID,
        
        [Parameter(Mandatory = $true)]
        [string]$DisplayName,
        
        [Parameter(Mandatory = $true)]
        [string]$Description,
        
        [Parameter(Mandatory = $false)]
        [bool]$NotLocalAdmin = $false,
        
        [Parameter(Mandatory = $false)]
        [bool]$SharedDevice = $false,
        
        [Parameter(Mandatory = $false)]
        [string]$AssignTo,
        
        [Parameter(Mandatory = $false)]
        [string]$DeviceNameTemplate,
        
        [Parameter(Mandatory = $false)]
        [bool]$AllowWhiteGlove = $false,
        
        [Parameter(Mandatory = $false)]
        [bool]$CollectHash = $false,
        
        [Parameter(Mandatory = $false)]
        [bool]$HideChangeAccount = $false,
        
        [Parameter(Mandatory = $false)]
        [bool]$HidePrivacy = $false,
        
        [Parameter(Mandatory = $false)]
        [bool]$HideTerms = $false,
        
        [Parameter(Mandatory = $false)]
        [bool]$AutoKeyboard = $false,
        
        [Parameter(Mandatory = $false)]
        [string]$Language = 'en-US'
    )

    Write-Verbose "Creating Autopilot configuration for $($CustomerTenantID.Count) tenant(s)"

    $endpoint = '/api/AddAutopilotConfig'
    
    foreach ($tenant in $CustomerTenantID) {
        $body = @{
            selectedTenants    = @{
                value = $tenant
            }
            Displayname        = $DisplayName
            Description        = $Description
            NotLocalAdmin      = $NotLocalAdmin.ToString().ToLower()
            DeploymentMode     = $SharedDevice.ToString().ToLower()
            Assignto           = $AssignTo
            deviceNameTemplate = $DeviceNameTemplate
            allowWhiteGlove    = $AllowWhiteGlove
            collectHash        = $CollectHash
            hideChangeAccount  = $HideChangeAccount
            hidePrivacy        = $HidePrivacy
            hideTerms          = $HideTerms
            Autokeyboard       = $AutoKeyboard
            languages          = @{
                value = $Language
            }
        }

        $Result = Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method Post
        
        if ($Result.Results) {
            Write-Verbose "Configuration created successfully for tenant: $tenant"
        } else {
            Write-Warning "Failed to create configuration for tenant: $tenant"
        }
        
        $Result
    }
}