<#
.SYNOPSIS
Retrieves a list of excluded tenants.

.DESCRIPTION
The Get-CIPPExcludedTenants function retrieves a list of excluded tenants from CIPP. It can retrieve all tenants or only the ones that are currently excluded.

.PARAMETER ListAll
Specifies whether to retrieve all tenants or only the ones that are currently excluded. By default, it retrieves only the excluded tenants.

.EXAMPLE
Get-CIPPExcludedTenants
Retrieves the list of currently excluded tenants.

.EXAMPLE
Get-CIPPExcludedTenants -ListAll
Retrieves the list of all tenants, including the ones that are not currently excluded.

#>

function Get-CIPPExcludedTenants {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)]
        [switch]$ListAll
    )

    Write-Verbose 'Getting Excluded Tenants List'

    $endpoint = '/api/execexcludetenant'
    if (!$listAll) {
        $params = @{
            List = 'true'
        }
    } else {
        $params = @{
            ListAll = 'true'
        }
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
        
}
