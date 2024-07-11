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

Get-CIPPLogs -Severity "Alert" -DateFilter "20240711"
Retrieves CIPP logs matching "alert" on 20240711
#>

function Get-CIPPLogs {
    [CmdletBinding()]
    Param(
        $Severity,
        $DateFilter
    )

    $endpoint = "/api/ListLogs"

    if($Severity -or $DateFilter){
        
        $Params = @{
            'Filter' = $True
        }

        if($Severity){
            $Params['Severity'] = $Severity
        }
        
        if($DateFilter){
            $Params['DateFilter'] = $DateFilter
        }else{
            $Params['DateFilter'] = (Get-Date -Format "yyyyMMdd")
        }

        Write-Verbose "Getting CIPP Logs"
        Invoke-CIPPRestMethod -Endpoint $endpoint -Param $Params

    }else{

        Write-Verbose "Getting CIPP Logs"
        Invoke-CIPPRestMethod -Endpoint $endpoint

    }
}
