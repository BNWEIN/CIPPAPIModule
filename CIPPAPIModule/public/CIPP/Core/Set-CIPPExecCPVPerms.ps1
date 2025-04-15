<#
.SYNOPSIS
Sets the CPV (Customer Provided Values) permissions for a specific customer tenant.

.DESCRIPTION
The Set-CIPPExecCPVPerms function is used to refresh the CPV permissions for a specified customer tenant. It calls the Invoke-CIPPRestMethod function internally to make the REST API call.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant for which the CPV permissions need to be refreshed. This parameter is mandatory.

.PARAMETER ResetSP
Specifies whether to reset the Stored Procedure (SP) associated with the CPV permissions. The valid values are "true" and "false". This parameter is optional and defaults to "false".

.EXAMPLE
Set-CIPPExecCPVPerms -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -ResetSP "true"
Refreshes the CPV permissions for the customer tenant with the ID "12345678-1234-1234-1234-1234567890AB" and resets the associated Stored Procedure.

.EXAMPLE
Set-CIPPExecCPVPerms -CustomerTenantID "87654321-4321-4321-4321-0987654321BA"
Refreshes the CPV permissions for the customer tenant with the ID "87654321-4321-4321-4321-0987654321BA" without resetting the associated Stored Procedure.
#>
function Set-CIPPExecCPVPerms {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [guid]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [bool]$ResetSP = $false
    )
    
    Write-Verbose "Refreshing CPV for $CustomerTenantID"
    $endpoint = '/api/ExecCPVPermissions'
    $body = @{
        tenantFilter = $CustomerTenantID
        ResetSP      = if ($ResetSP -eq $true) { 'true' } else { 'false' }
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
