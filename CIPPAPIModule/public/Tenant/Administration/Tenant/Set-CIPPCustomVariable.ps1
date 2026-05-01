<#
.SYNOPSIS
    Sets a custom variable for a tenant in the CIPP system.

.DESCRIPTION
    The Set-CIPPCustomVariable function creates or updates a custom variable for a specific tenant,
    or for all tenants when using 'AllTenants'.

.PARAMETER CustomerTenantID
    The tenant ID to scope the custom variable to, or 'AllTenants' for a global variable.

.PARAMETER VariableName
    The custom variable name to create or update.

.PARAMETER Value
    The value to assign to the custom variable.

.PARAMETER Description
    An optional description for the custom variable.

.EXAMPLE
    Set-CIPPCustomVariable -CustomerTenantID "12345678-1234-1234-1234-1234567890ab" -VariableName "WallpaperPath" -Value "C:\Wallpapers"
    Creates or updates the WallpaperPath custom variable for the specified tenant.

.EXAMPLE
    Set-CIPPCustomVariable -CustomerTenantID "AllTenants" -VariableName "CompanyName" -Value "Contoso" -Description "Global branding variable"
    Creates or updates a global custom variable used for all tenants.
#>
function Set-CIPPCustomVariable {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true)]
        [string]$VariableName,

        [Parameter(Mandatory = $true)]
        [string]$Value,

        [Parameter(Mandatory = $false)]
        [string]$Description
    )

    Write-Verbose "Setting custom variable '$VariableName' for tenant $CustomerTenantID"

    $endpoint = '/api/ExecCippReplacemap'
    $body = @{
        tenantId    = $CustomerTenantID
        Action      = 'AddEdit'
        RowKey      = $VariableName
        Value       = $Value
        Description = $Description
    }

    (Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST).Results
}
