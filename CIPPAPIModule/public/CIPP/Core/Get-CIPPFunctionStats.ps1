<#
.SYNOPSIS
Gets CIPP function statistics.

.DESCRIPTION
The Get-CIPPFunctionStats function retrieves statistical information about CIPP function usage and performance.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant to filter results for. Use 'AllTenants' to view all tenants.

.PARAMETER FunctionType
Specifies the type of functions to retrieve stats for. Defaults to 'Durable'.

.PARAMETER LookbackPeriod
A timespan object specifying how far back to retrieve stats from.
Will be converted to appropriate interval (days, hours, or minutes).

.EXAMPLE
Get-CIPPFunctionStats -CustomerTenantID "AllTenants" -FunctionType "Durable" -LookbackPeriod ([TimeSpan]::FromDays(7))
Gets function statistics for all tenants from the past 7 days.

.EXAMPLE
Get-CIPPFunctionStats -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -LookbackPeriod ([TimeSpan]::FromHours(24))
Gets function statistics for the specified tenant from the past 24 hours.

.NOTES
Requires CIPP.Core.Read permissions.
#>

function Get-CIPPFunctionStats {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $false)]
        [string]$FunctionType = 'Durable',

        [Parameter(Mandatory = $false)]
        [timespan]$LookbackPeriod
    )

    Write-Verbose "Getting function statistics for tenant filter '$CustomerTenantID'"

    $endpoint = '/api/ListFunctionStats'
    $params = @{
        tenantFilter = $CustomerTenantID
        FunctionType = $FunctionType
    }

    if ($LookbackPeriod) {
        if ($LookbackPeriod.Days -gt 0) {
            $params['Interval'] = 'Days'
            $params['Time'] = $LookbackPeriod.Days
        } elseif ($LookbackPeriod.Hours -gt 0) {
            $params['Interval'] = 'Hours'
            $params['Time'] = $LookbackPeriod.Hours
        } else {
            $params['Interval'] = 'Minutes'
            $params['Time'] = $LookbackPeriod.Minutes
        }
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}