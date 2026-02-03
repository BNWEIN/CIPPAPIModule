<#
.SYNOPSIS
Retrieves CIPP logs from the API.

.DESCRIPTION
The Get-CIPPLogs function retrieves logs from the CIPP API by invoking the "/api/ListLogs" endpoint.
You can filter logs by severity level and date range using the available parameters.

.PARAMETER Severity
Filters logs by severity level. Accepts any of: debug, info, warn, error, critical, alert.
If DateFilter is not specified alongside, it assumes current date in local time.

.PARAMETER DateFilter
Date in "yyyyMMdd" format. Defaults to current date if not specified.
This should be in the time zone of your CIPP instance (default UTC).

.PARAMETER StartDate
Start date for filtering logs in "yyyyMMdd" format.
Use with EndDate to specify a date range.

.PARAMETER EndDate
End date for filtering logs in "yyyyMMdd" format.
Use with StartDate to specify a date range.

.EXAMPLE
Get-CIPPLogs
Retrieves CIPP logs from the API for the current date.

.EXAMPLE
Get-CIPPLogs -Severity "Alert" -DateFilter "20240711"
Retrieves CIPP logs matching "alert" severity on 20240711.

.EXAMPLE
Get-CIPPLogs -StartDate "20240701" -EndDate "20240731"
Retrieves all CIPP logs between July 1, 2024 and July 31, 2024.

.EXAMPLE
Get-CIPPLogs -Severity "Error" -StartDate "20240701" -EndDate "20240731"
Retrieves error logs between July 1, 2024 and July 31, 2024.
#>

function Get-CIPPLogs {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $false)]
        [ValidateSet(
            'error',
            'alert',
            'debug',
            'info',
            'warn',
            'critical'
        )]
        [string]$Severity,
        [Parameter(Mandatory = $false)]
        [string]$DateFilter = (Get-Date -Format 'yyyyMMdd'),
        [Parameter(Mandatory = $false)]
        [string]$StartDate,
        [Parameter(Mandatory = $false)]
        [string]$EndDate

    )

    $endpoint = '/api/ListLogs'

        
    $Params = @{
        'Filter'     = $True
        'DateFilter' = $DateFilter
        'StartDate'  = $StartDate
        'EndDate'    = $EndDate
    }

    if ($Severity) {
        $Params['Severity'] = $Severity
    }
    
    Write-Verbose 'Getting CIPP Logs'
    Invoke-CIPPRestMethod -Endpoint $endpoint -Param $Params
}
