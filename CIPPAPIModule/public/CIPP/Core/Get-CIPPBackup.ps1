<#
.SYNOPSIS
Lists CIPP backups.

.DESCRIPTION
The Get-CIPPBackup function retrieves a list of CIPP backups, with optional filtering capabilities.

.PARAMETER Type
Optional. Filter backups by type.

.PARAMETER TenantFilter
Optional. Filter backups by tenant.

.PARAMETER BackupName
Optional. Filter backups by name.

.PARAMETER NameOnly
Optional. When specified, returns only backup names and timestamps.

.EXAMPLE
Get-CIPPBackup
Returns all backups.

.EXAMPLE
Get-CIPPBackup -Type "Configuration" -TenantFilter "contoso.com"
Returns configuration backups for the specified tenant.

.EXAMPLE
Get-CIPPBackup -NameOnly
Returns a list of backup names and timestamps.

.NOTES
Requires CIPP.Backup.Read permissions.
#>

function Get-CIPPBackup {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]$Type,

        [Parameter(Mandatory = $false)]
        [string]$TenantFilter,

        [Parameter(Mandatory = $false)]
        [string]$BackupName,

        [Parameter(Mandatory = $false)]
        [switch]$NameOnly
    )

    Write-Verbose 'Getting backup information'

    $endpoint = '/api/ExecListBackup'
    $params = @{}

    if ($Type) { 
        Write-Verbose "Filtering by type: $Type"
        $params['Type'] = $Type 
    }
    if ($TenantFilter) { 
        Write-Verbose "Filtering by tenant: $TenantFilter"
        $params['TenantFilter'] = $TenantFilter 
    }
    if ($BackupName) { 
        Write-Verbose "Filtering by name: $BackupName"
        $params['BackupName'] = $BackupName 
    }
    if ($NameOnly) { 
        Write-Verbose 'Returning names only'
        $params['NameOnly'] = $true 
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}