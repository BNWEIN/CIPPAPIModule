<#
.SYNOPSIS
Gets CIPP function statistics.

.DESCRIPTION
The Get-CIPPFunctionStats function retrieves statistical information about CIPP function usage and performance.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant to filter results for. Use 'AllTenants' to view all tenants.

.PARAMETER FunctionType
Specifies the type of functions to retrieve stats for. Defaults to 'Durable'.

.PARAMETER Interval
Specifies the time interval unit to look back. Valid values are 'Days', 'Hours', or 'Minutes'.

.PARAMETER Time
Specifies the number of interval units to look back. For example, if Interval is 'Days' and Time is 7, looks back 7 days.

.EXAMPLE
Get-CIPPFunctionStats -CustomerTenantID "AllTenants" -FunctionType "Durable" -Interval Days -Time 7
Gets function statistics for all tenants from the past 7 days.

.EXAMPLE
Get-CIPPFunctionStats -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -Interval Hours -Time 24
Gets function statistics for the specified tenant from the past 24 hours.

.NOTES
Requires CIPP.Core.Read permissions.
#>

function Get-CIPPFunctionStats {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]$CustomerTenantID = 'AllTenants',

        [Parameter(Mandatory = $false)]
        [string]$FunctionType = 'Durable',

        [Parameter(Mandatory = $false)]
        [ValidateSet('Days', 'Hours', 'Minutes')]
        [string]$Interval,

        [Parameter(Mandatory = $false)]
        [int]$Time
    )

    Write-Verbose "Getting function statistics for tenant filter '$CustomerTenantID'"

    $endpoint = '/api/ListFunctionStats'
    $params = @{
        TenantFilter = $CustomerTenantID
        FunctionType = $FunctionType
    }

    if ($Interval -and $Time) {
        $params['Interval'] = $Interval
        $params['Time'] = $Time
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}