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

.PARAMETER VariableType
    Optional. One of string, integer, boolean or json. Defaults to string, which is substituted
    into templates as text; the other three are written as JSON literals (300 rather than "300").
    The API rejects a value that does not parse as the declared type.

.EXAMPLE
    Set-CIPPCustomVariable -CustomerTenantID "12345678-1234-1234-1234-1234567890ab" -VariableName "WallpaperPath" -Value "C:\Wallpapers"
    Creates or updates the WallpaperPath custom variable for the specified tenant.

.EXAMPLE
    Set-CIPPCustomVariable -CustomerTenantID "AllTenants" -VariableName "CompanyName" -Value "Contoso" -Description "Global branding variable"
    Creates or updates a global custom variable used for all tenants.

.EXAMPLE
    Set-CIPPCustomVariable -CustomerTenantID "AllTenants" -VariableName "LockSeconds" -Value "300" -VariableType integer
    Creates a typed variable that is written into templates as the number 300.
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
        [string]$Description,

        [Parameter(Mandatory = $false)]
        [ValidateSet('string', 'integer', 'boolean', 'json')]
        [string]$VariableType
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
    if ($VariableType) { $body['VariableType'] = $VariableType }

    (Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST).Results
}
