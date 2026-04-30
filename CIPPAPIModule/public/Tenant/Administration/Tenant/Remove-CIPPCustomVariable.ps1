<#
.SYNOPSIS
    Removes a custom variable for a tenant in the CIPP system.

.DESCRIPTION
    The Remove-CIPPCustomVariable function deletes a custom variable for a specific tenant,
    or from global variables when using 'AllTenants'.

.PARAMETER CustomerTenantID
    The tenant ID to remove the custom variable from, or 'AllTenants' for a global variable.

.PARAMETER VariableName
    The custom variable name to remove.

.EXAMPLE
    Remove-CIPPCustomVariable -CustomerTenantID "12345678-1234-1234-1234-1234567890ab" -VariableName "WallpaperPath"
    Removes the WallpaperPath custom variable for the specified tenant.

.EXAMPLE
    Remove-CIPPCustomVariable -CustomerTenantID "AllTenants" -VariableName "CompanyName"
    Removes the global custom variable named CompanyName.
#>
function Remove-CIPPCustomVariable {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true)]
        [string]$VariableName
    )

    Write-Verbose "Removing custom variable '$VariableName' for tenant $CustomerTenantID"

    $endpoint = '/api/ExecCippReplacemap'
    $body = @{
        tenantId = $CustomerTenantID
        Action   = 'Delete'
        RowKey   = $VariableName
    }

    (Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST).Results
}
