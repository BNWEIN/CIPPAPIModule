<#
.SYNOPSIS
Retrieves the list of CIPP execution API permissions.

.DESCRIPTION
The Get-CIPPExecAPIPermissionsList function retrieves the list of CIPP execution API permissions by making a REST API call to the specified endpoint.

.PARAMETER None
This function does not accept any parameters.

.EXAMPLE
Get-CIPPExecAPIPermissionsList
Retrieves the list of CIPP execution API permissions.

#>

function Get-CIPPExecAPIPermissionsList {
    [CmdletBinding()]
    Param()

    Write-Verbose "Getting CIPP Logs"
    $endpoint = "/api/ExecAPIPermissionList"
    
    Invoke-CIPPRestMethod -Endpoint $endpoint
}

