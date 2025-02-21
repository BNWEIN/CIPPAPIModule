<#
.SYNOPSIS
Removes an Intune script.

.DESCRIPTION
The Remove-CIPPIntuneScript function removes a specified script from Microsoft Intune.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER ScriptID
Specifies the ID of the script to remove.

.PARAMETER ScriptType
Specifies the type of script to remove. Valid values are:
- Windows (Device Management Scripts)
- MacOS (Shell Scripts)
- Remediation (Device Health Scripts)
- Linux (Configuration Policies)

.PARAMETER DisplayName
Specifies the display name of the script being removed. Used for logging purposes.

.EXAMPLE
Remove-CIPPIntuneScript -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -ScriptID "87654321-4321-4321-4321-BA0987654321" -ScriptType "Windows" -DisplayName "Windows Cleanup Script"
Removes the specified Windows script from Intune.

.NOTES
Requires Endpoint.MEM.ReadWrite permissions.
Different script types are stored in different Graph API endpoints.
#>

function Remove-CIPPIntuneScript {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true)]
        [string]$ScriptID,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Windows', 'MacOS', 'Remediation', 'Linux')]
        [string]$ScriptType,

        [Parameter(Mandatory = $false)]
        [string]$DisplayName
    )

    if ([string]::IsNullOrWhiteSpace($DisplayName)) {
        Write-Verbose 'DisplayName is not provided. Proceeding without a display name.'
        $DisplayName = $ScriptID
    }

    Write-Verbose "Removing $ScriptType script '$DisplayName' with ID $ScriptID from tenant $CustomerTenantID"

    $endpoint = '/api/RemoveIntuneScript'
    $body = @{
        tenantFilter = $CustomerTenantID
        ID           = $ScriptID
        ScriptType   = $ScriptType
        DisplayName  = $DisplayName
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}