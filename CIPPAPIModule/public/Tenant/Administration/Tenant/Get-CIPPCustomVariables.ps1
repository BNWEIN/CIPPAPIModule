<#
.SYNOPSIS
    Retrieves custom variables for a specified tenant from the CIPP system.

.DESCRIPTION
    The Get-CIPPCustomVariables function retrieves all custom variables associated with a specific
    tenant in CIPP

.PARAMETER CustomerTenantID
    The tenant ID for which to retrieve custom variables, or 'AllTenants' for global variables.

.PARAMETER IncludeGlobal
    Also return the global (AllTenants) variables alongside the tenant's own. Global rows are
    marked Scope = 'Global'; a tenant variable that shadows a global one is marked
    Scope = 'Overridden' and the shadowed global row is left out.

.OUTPUTS
    Returns a collection of custom variables from the CIPP system for the specified tenant.

.EXAMPLE
    PS> Get-CIPPCustomVariables -CustomerTenantID "12345678-1234-1234-1234-1234567890ab"
    Retrieves all custom variables for the specified tenant.

.EXAMPLE
    PS> Get-CIPPCustomVariables -CustomerTenantID "AllTenants"
    Retrieves global custom variables that apply to all tenants.

.EXAMPLE
    PS> Get-CIPPCustomVariables -CustomerTenantID "12345678-1234-1234-1234-1234567890ab" -IncludeGlobal
    Retrieves the tenant's variables plus the inherited global ones.

.NOTES
    This function requires appropriate permissions to access the CIPP API.
#>
function Get-CIPPCustomVariables {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $false)]
        [switch]$IncludeGlobal
    )

    Write-Verbose "Getting custom variables for tenant $CustomerTenantID"
    $endpoint = '/api/ExecCippReplacemap'
    $params = @{
        tenantId = $CustomerTenantID
        Action   = 'List'
    }
    if ($IncludeGlobal) { $params['includeGlobal'] = $true }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
