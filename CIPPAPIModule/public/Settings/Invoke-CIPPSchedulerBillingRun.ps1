<#
.SYNOPSIS
Executes the scheduler billing run.

.DESCRIPTION
The Invoke-CIPPSchedulerBillingRun function executes the scheduler billing run.

.EXAMPLE
Invoke-CIPPSchedulerBillingRun
Executes the scheduler billing run.
#>
function Invoke-CIPPSchedulerBillingRun {
    [CmdletBinding()]
    param ()
    
    Write-Verbose 'Executing scheduler billing run'

    $endpoint = '/api/ExecSchedulerBillingRun' 
    $body = @{ 
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST 
}