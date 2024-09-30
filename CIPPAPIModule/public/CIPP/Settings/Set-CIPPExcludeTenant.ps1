<#
.SYNOPSIS
Sets the exclusion status for a customer tenant in the CIPP system.

.DESCRIPTION
The Set-CIPPExcludeTenant function is used to add or remove a customer tenant from the exclusion list in the CIPP system. 
Exclusion means that the tenant will be excluded from certain operations or processes in the system.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant. If you are adding a tenant, this needs to be their default domain (contoso.onmicrosoft.com), if you are
excluding a tenant this needs to be the tenant ID Guid (1fefeb73-0947-4803-a720-92be0e9a7d8e)

.PARAMETER AddExclusion
Indicates whether to add the customer tenant to the exclusion list. This switch cannot be used together with the RemoveExclusion switch.

.PARAMETER RemoveExclusion
Indicates whether to remove the customer tenant from the exclusion list. This switch cannot be used together with the AddExclusion switch.

.EXAMPLE
Set-CIPPExcludeTenant -CustomerTenantID "1fefeb73-0947-4803-a720-92be0e9a7d8e" -AddExclusion
Adds the customer tenant with ID "1fefeb73-0947-4803-a720-92be0e9a7d8e" to the exclusion list.

.EXAMPLE
Set-CIPPExcludeTenant -CustomerTenantID "contoso.onmicrosoft.com" -RemoveExclusion
Removes the customer tenant with ID "contoso.onmicrosoft.com" from the exclusion list.

#>
function Set-CIPPExcludeTenant {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter()]
        [switch]$AddExclusion,
        [Parameter()]
        [switch]$RemoveExclusion
    )

    # Ensure only one of the switches is used
    if ($AddExclusion -and $RemoveExclusion) {
        throw 'You cannot use both -AddExclusion and -RemoveExclusion switches at the same time.'
    }

    if (-not $AddExclusion -and -not $RemoveExclusion) {
        throw 'You must specify either -AddExclusion or -RemoveExclusion switch.'
    }

    $endpoint = '/api/execexcludetenant'

    if ($RemoveExclusion) {
        $params = @{
            TenantFilter    = $CustomerTenantID
            RemoveExclusion = $true
        }
        Write-Verbose "Removing Tenant $CustomerTenantID from the exclusion list."
        Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
    } else {
        $params = @{
            AddExclusion = $true
        }
        $body = @{
            value = $CustomerTenantID
        }
        Write-Verbose "Adding Tenant $CustomerTenantID to the exclusion list."
        Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Body $body -Method POST
    }
}