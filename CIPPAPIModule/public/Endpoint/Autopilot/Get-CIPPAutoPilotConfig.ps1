<#
.SYNOPSIS
    Retrieves AutoPilot configuration information for a specified customer tenant ID and type.

.DESCRIPTION
    The Get-CIPPAutoPilotConfig function retrieves AutoPilot configuration information for a specified customer tenant ID and type. 
    It makes a REST API call to the generic Graph request endpoint to retrieve the configuration data.

.PARAMETER CustomerTenantID
    Specifies the customer tenant ID for which to retrieve the AutoPilot configuration.

.PARAMETER Type
    Specifies the type of AutoPilot configuration to retrieve. Valid values are "ESP" and "ApProfile".

.EXAMPLE
    Get-CIPPAutoPilotConfig -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -Type "ESP"
    Retrieves the AutoPilot Status Page for the customer tenant ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.EXAMPLE
    Get-CIPPAutoPilotConfig -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -Type "ApProfile"
    Retrieves the AutoPilot Profile for the customer tenant ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
function Get-CIPPAutoPilotConfig {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [ValidateSet('ESP', 'ApProfile')]
        [string]$Type
    )
    
    if ($Type -eq 'ESP') {
        Write-Verbose "Getting AutoPilot Status Page for $CustomerTenantID"
    } elseif ($Type -eq 'ApProfile') {
        Write-Verbose "Getting AutoPilot Profile for customer: $CustomerTenantID"
    }
    
    $Endpoint = '/api/ListGraphRequest'
    $Params = @{
        tenantFilter = $CustomerTenantID
    }

    if ($Type -eq 'ESP') {
        $Params['endpoint'] = 'deviceManagement/deviceEnrollmentConfigurations'
        $Params['$expand'] = 'assignments'
        $Params['$filter'] = "deviceEnrollmentConfigurationType eq 'windows10EnrollmentCompletionPageConfiguration'"
    } elseif ($Type -eq 'ApProfile') {
        $Params['endpoint'] = 'deviceManagement/windowsAutopilotDeploymentProfiles'
        $Params['$expand'] = 'assignments'
    }
        
    (Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params).Results
}
