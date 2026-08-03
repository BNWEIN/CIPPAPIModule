<#
.SYNOPSIS
    Sets properties for a tenant in the CIPP system.

.DESCRIPTION
    The Set-CIPPTenantProperty function sets the alias and tenant group for a specific tenant.

.PARAMETER CustomerTenantID
    The customer tenant ID
	
.PARAMETER TenantAlias
    The tenant alias

.PARAMETER TenantGroups
    The tenant groups

.EXAMPLE
    Set-CIPPTenantProperty -CustomerTenantID "12345678-1234-1234-1234-1234567890ab" -TenantAlias "Contoso, LLC"
    Updates the TenantAlias for the specified tenant and removes existing TenantGroups

.EXAMPLE
    Set-CIPPTenantProperty -CustomerTenantID "12345678-1234-1234-1234-1234567890ab" -TenantAlias "Contoso, LLC" -TenantGroups 
    Adds or updates the TenantAlias and TenantGroups for the specified tenant.
#>
function Set-CIPPCustomVariable {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true)]
        [string]$TenantAlias,

        [Parameter(Mandatory = $true)]
        [hashtable][]$TenantGroups = @(),

    )

    Write-Verbose "Setting properties for the tenant $CustomerTenantID"

    $endpoint = '/api/EditTenant'
    $body = @{
        customerId    = $CustomerTenantID
        tenantAlias   = $tenantAlias
        tenantGroups  = $tenantGroups
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
