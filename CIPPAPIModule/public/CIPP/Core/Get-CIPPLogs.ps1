<#
.SYNOPSIS
Retrieves CIPP logs from the API.

.DESCRIPTION
The Get-CIPPLogs function retrieves logs from the CIPP API by invoking the "/api/ListLogs" endpoint.

.PARAMETER Severity
Accepts any of: debug,info,warn,error,critical,alert. If DateFilter is not specified alongside, it assumes current date in local time.

.PARAMETER DateFilter
Date in "yyyyMMdd" format. This should be in the time zone of your CIPP instance (default UTC).

.EXAMPLE
Get-CIPPLogs
Retrieves CIPP logs from the API.

.EXAMPLE
Get-CIPPLogs -Severity "Alert" -DateFilter "20240711"
Retrieves CIPP logs matching "alert" on 20240711
#>

function Get-CIPPLogs {
    [CmdletBinding()]
    Param(
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
        [string]$DateFilter = (Get-Date -Format 'yyyyMMdd')
    )

    $endpoint = '/api/ListLogs'

        
    $Params = @{
        'Filter'     = $True
        'DateFilter' = $DateFilter
    }

    if ($Severity) {
        $Params['Severity'] = $Severity
    }
    
    Write-Verbose 'Getting CIPP Logs'
    Invoke-CIPPRestMethod -Endpoint $endpoint -Param $Params
}
