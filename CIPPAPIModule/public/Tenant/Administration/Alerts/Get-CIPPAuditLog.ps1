<#
.SYNOPSIS
Gets audit logs from CIPP.

.DESCRIPTION
The Get-CIPPAuditLog function retrieves audit logs from CIPP with various filtering options. It allows filtering by tenant, specific log ID, date range, or relative time period.

.PARAMETER CustomerTenantID
The ID of the customer tenant to get logs from. Use 'AllTenants' for logs across all tenants.

.PARAMETER LogID 
A specific log entry ID to retrieve.

.PARAMETER StartDate
The start date for filtering logs. Accepts DateTime object.

.PARAMETER EndDate
The end date for filtering logs. Accepts DateTime object.

.PARAMETER RelativeTime
A timespan object specifying a relative time period to retrieve logs from.
Will be converted to format: Xd (days), Xh (hours), or Xm (minutes).

.EXAMPLE
Get-CIPPAuditLog -CustomerTenantID "12345678-1234-1234-1234-1234567890AB"
Gets audit logs for specified tenant using default 2 day time range.

.EXAMPLE
Get-CIPPAuditLog -CustomerTenantID "AllTenants" -RelativeTime ([TimeSpan]::FromHours(24))
Gets audit logs across all tenants from the last 24 hours.

.EXAMPLE
Get-CIPPAuditLog -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -StartDate (Get-Date).AddDays(-7) -EndDate (Get-Date)
Gets audit logs for specified tenant from the last 7 days.

.EXAMPLE
Get-CIPPAuditLog -LogID "abc123" -CustomerTenantID "tenant1" -RelativeTime ([TimeSpan]::FromDays(1))
Gets a specific audit log entry.

.NOTES
Requires CIPP.Alert.Read permissions.
Defaults to last 2 days if no valid relative time specified.
Calls /api/ListAuditLogs endpoint.
#>

function Get-CIPPAuditLog {
    [CmdletBinding(DefaultParameterSetName = 'RelativeTime')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'TimeRange')]
        [Parameter(Mandatory = $true, ParameterSetName = 'RelativeTime')]
        [string]$CustomerTenantID,
        
        [Parameter(Mandatory = $false)]
        [string]$LogID,
        
        [Parameter(Mandatory = $false, ParameterSetName = 'TimeRange')]
        [ValidateNotNullOrEmpty()]
        [datetime]$StartDate,
        
        [Parameter(Mandatory = $false, ParameterSetName = 'TimeRange')]
        [ValidateNotNullOrEmpty()]
        [datetime]$EndDate,
        
        [Parameter(Mandatory = $false, ParameterSetName = 'TimeRange')]
        [Parameter(Mandatory = $true, ParameterSetName = 'RelativeTime')]
        [timespan]$RelativeTime
    )

    Write-Verbose "Getting audit logs for tenant $CustomerTenantID"

    # Convert relative time to expected input format
    if ($RelativeTime.Days -ne 0) {
        $RelativeTimeFormatted = "$($RelativeTime.Days)d"
    } elseif ($RelativeTime.Hours -ne 0) {
        $RelativeTimeFormatted = "$($RelativeTime.Hours)h"
    } elseif ($RelativeTime.Minutes -ne 0) {
        $RelativeTimeFormatted = "$($RelativeTime.Minutes)m"
    } else {
        Write-Warning 'No valid relative time specified. Defaulting to last 2 days.'
        $RelativeTimeFormatted = '2d'
    }

    $endpoint = '/api/ListAuditLogs'
    $params = @{
        tenantFilter = $CustomerTenantID
        LogId        = $LogID
        RelativeTime = $RelativeTimeFormatted
    }
    if ($null -ne $StartDate) {
        $params['StartDate'] = (ConvertTo-UnixTime $StartDate)
    }
    if ($null -ne $EndDate) {
        $params['EndDate'] = (ConvertTo-UnixTime $EndDate)
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}