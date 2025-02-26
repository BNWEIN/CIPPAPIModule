<#
.SYNOPSIS
Syncs AutoPilot devices for a specified customer tenant ID.

.DESCRIPTION
The Set-CIPPAutoPilotSync function is used to sync AutoPilot devices for a specific customer tenant ID. It makes a request to the specified endpoint with the provided parameters.

.PARAMETER CustomerTenantID
Specifies the customer tenant ID for which the AutoPilot devices need to be synced.

.EXAMPLE
Set-CIPPAutoPilotSync -CustomerTenantID "contoso.onmicrosoft.com"
Syncs AutoPilot devices for the customer tenant ID "contoso.onmicrosoft.com".

#>
Function Set-CIPPAutoPilotSync {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Syncing AutoPilot Devices for $CustomerTenantID"
    
    # Define the endpoint and parameters
    $Endpoint = '/api/ExecSyncAPDevices'
    $Params = @{
        tenantFilter = $CustomerTenantID
    }
    
    # Use the Invoke-CIPPRequest function to make the request
    Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params -Method POST
}
