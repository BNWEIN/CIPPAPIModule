<#
.SYNOPSIS
    Retrieves custom variables for a specified tenant from the CIPP system.

.DESCRIPTION
    The Get-CIPPCustomVariables function retrieves all custom variables associated with a specific
    tenant in CIPP

.PARAMETER CustomerTenantID
    The GUID of the tenant for which to retrieve custom variables. This parameter is mandatory.

.OUTPUTS
    Returns a collection of custom variables from the CIPP system for the specified tenant.

.EXAMPLE
    PS> Get-CIPPCustomVariables -CustomerTenantID "12345678-1234-1234-1234-1234567890ab"
    Retrieves all custom variables for the specified tenant.

.NOTES
    This function requires appropriate permissions to access the CIPP API.
#>
function Get-CIPPCustomVariables {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [guid]$CustomerTenantID
    )
    
    Write-Verbose "Getting org $CustomerTenantID"
    $endpoint = '/api/ExecCippReplacemap'
    $params = @{
        tenantId = $CustomerTenantID
        Action   = 'List'
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
