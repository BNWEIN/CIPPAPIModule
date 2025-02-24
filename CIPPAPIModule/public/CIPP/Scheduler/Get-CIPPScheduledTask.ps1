<#
.SYNOPSIS
Gets scheduled tasks from CIPP.

.DESCRIPTION
The Get-CIPPScheduledTask function retrieves scheduled tasks from CIPP with optional filtering capabilities.

.PARAMETER ShowHidden
Optional. If specified, includes hidden tasks in the results.

.PARAMETER Name
Optional. Filter tasks by name.

.PARAMETER Type
Optional. Filter tasks by command type.

.EXAMPLE
Get-CIPPScheduledTask
Returns all visible scheduled tasks.

.EXAMPLE
Get-CIPPScheduledTask -ShowHidden
Returns all scheduled tasks, including hidden ones.

.EXAMPLE
Get-CIPPScheduledTask -Name "Daily Backup" -Type "Backup"
Returns tasks matching the specified name and type.

.NOTES
Requires CIPP.Scheduler.Read permissions.
Tasks are filtered based on the user's tenant access permissions.
#>

function Get-CIPPScheduledTask {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [switch]$ShowHidden,

        [Parameter(Mandatory = $false)]
        [string]$Name,

        [Parameter(Mandatory = $false)]
        [string]$Type
    )

    Write-Verbose 'Getting scheduled tasks'

    $endpoint = '/api/ListScheduledItems'
    $params = @{}

    if ($ShowHidden) { 
        Write-Verbose 'Including hidden tasks'
        $params['ShowHidden'] = $true 
    }
    if ($Name) { 
        Write-Verbose "Filtering by name: $Name"
        $params['Name'] = $Name 
    }
    if ($Type) { 
        Write-Verbose "Filtering by type: $Type"
        $params['Type'] = $Type 
    }

    $tasks = Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET

    foreach ($task in $tasks) {
        # Ensure Parameters property exists
        if (-not $task.Parameters) {
            $task | Add-Member -NotePropertyName Parameters -NotePropertyValue @{} -Force
        }
        # Convert Parameters from string to object if needed
        elseif ($task.Parameters -is [string]) {
            try {
                $task.Parameters = $task.Parameters | ConvertFrom-Json -ErrorAction Stop
            } catch {
                Write-Verbose "Failed to parse Parameters JSON for task: $($task.Name)"
                $task.Parameters = @{}
            }
        }
    }

    $tasks
}