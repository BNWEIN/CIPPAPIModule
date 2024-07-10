<#
.SYNOPSIS
Retrieves CIPP logs from the API.

.DESCRIPTION
The Get-CIPPLogs function retrieves logs from the CIPP API by invoking the "/api/ListLogs" endpoint.

.PARAMETER Severity
Accepts any of: debug,info,warn,error,critical,alert

.PARAMETER DateFilter
Date in local time, in any format Get-Date can ingest. This gets converted to UTC.

.EXAMPLE
Get-CIPPLogs
Retrieves CIPP logs from the API.

Get-CIPPLogs -Severity "Alert" -DateFilter "07/10/2024"
Retrieves CIPP logs matching "alert" on 07/10/2024
#>

function Get-CIPPLogs {
    [CmdletBinding()]
    Param(
        $Severity,
        $DateFilter
    )


    if($Severity -or $DateFilter){
        $Params = @{
            'Filter' = $True
        }

        if($Severity){
            $Params['Severity'] = $Severity
        }
        
        if($DateFilter){
            try{
                $DateFilterUTC = $DateFilter | Get-Date -Format "yyyyMMdd" -AsUTC -ErrorAction Stop
                $Params['DateFilter'] = $DateFilterUTC
            }catch{
                Write-Warning "Date format invalid! Ignoring.."
            }
        }

        Write-Verbose "Getting CIPP Logs"
        Invoke-CIPPRestMethod -Endpoint $endpoint -Param $Params

    }else{
        $endpoint = "/api/ListLogs"
        Write-Verbose "Getting CIPP Logs"
        Invoke-CIPPRestMethod -Endpoint $endpoint
    }
}
