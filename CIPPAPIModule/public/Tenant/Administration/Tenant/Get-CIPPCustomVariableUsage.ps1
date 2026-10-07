<#
.SYNOPSIS
    Lists every definition of every custom variable name across all tenants in CIPP.

.DESCRIPTION
    The Get-CIPPCustomVariableUsage function answers "where else does this variable name exist".
    Custom variables are stored one row per tenant, but a variable name is the unit an operator
    thinks in (the same %wallpaperpath% deployed to many tenants), so the result is grouped by
    name with every tenant and global definition nested underneath. It needs no tenant.

.PARAMETER VariableName
    Optional. Only return the entry for this variable name. The filter is applied client-side
    and is case-insensitive.

.OUTPUTS
    One object per variable name:
      Name, Variable (%Name%), SuggestedType, HasGlobal, TenantCount, TypesConsistent, Types,
      Definitions (Scope, TenantId, TenantName, Value, VariableType, Description per definition).

.EXAMPLE
    PS> Get-CIPPCustomVariableUsage
    Lists every custom variable name and where it is defined.

.EXAMPLE
    PS> Get-CIPPCustomVariableUsage -VariableName 'wallpaperpath'
    Shows the global and per-tenant definitions of the wallpaperpath variable.

.EXAMPLE
    PS> Get-CIPPCustomVariableUsage | Where-Object { -not $_.TypesConsistent }
    Finds variable names that are typed differently in different tenants.
#>
function Get-CIPPCustomVariableUsage {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]$VariableName
    )

    Write-Verbose 'Getting custom variable usage across all tenants'

    $endpoint = '/api/ExecCippReplacemap'
    $params = @{
        Action = 'Usage'
    }
    $Usage = (Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params).Results

    # The backend has no name filter for Usage, so narrow client-side.
    if ($VariableName) {
        $Usage = $Usage | Where-Object { $_.Name -eq $VariableName }
    }
    $Usage
}
