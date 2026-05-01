<#
.SYNOPSIS
    Retrieves custom variables for a specified tenant from the CIPP system.

.DESCRIPTION
    The Get-CIPPCustomVariables function retrieves all custom variables associated with a specific
    tenant in CIPP

.PARAMETER CustomerTenantID
    The tenant ID for which to retrieve custom variables, or 'AllTenants' for global variables.

.OUTPUTS
    Returns a collection of custom variables from the CIPP system for the specified tenant.

.EXAMPLE
    PS> Get-CIPPCustomVariables -CustomerTenantID "12345678-1234-1234-1234-1234567890ab"
    Retrieves all custom variables for the specified tenant.

.EXAMPLE
    PS> Get-CIPPCustomVariables -CustomerTenantID "AllTenants"
    Retrieves global custom variables that apply to all tenants.

.NOTES
    This function requires appropriate permissions to access the CIPP API.
#>
function Get-CIPPCustomVariables {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting custom variables for tenant $CustomerTenantID"
    $endpoint = '/api/ExecCippReplacemap'
    $params = @{
        tenantId = $CustomerTenantID
        Action   = 'List'
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
