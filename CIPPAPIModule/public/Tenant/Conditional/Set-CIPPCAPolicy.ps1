<#
.SYNOPSIS
Sets the Conditional Access (CA) Policy for a specific customer tenant.

.DESCRIPTION
The Set-CIPPCAPolicy function is used to set the Conditional Access (CA) Policy for a specific customer tenant. It allows you to enable or disable the CA Policy for the tenant.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant for which the CA Policy needs to be set.

.PARAMETER State
Specifies the state of the CA Policy. Valid values are "Enabled" and "Disabled".

.PARAMETER Guid
Specifies the GUID of the CA Policy.

.EXAMPLE
Set-CIPPCAPolicy -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -State "Enabled" -Guid "a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p6"
Sets the CA Policy for the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" to "Enabled" using the GUID "a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p6".

.EXAMPLE
Set-CIPPCAPolicy -CustomerTenantID "contoso.onmicrosoft.com" -State "Enabled" -Guid "a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p6"
Sets the CA Policy for the customer tenant with ID "contoso.onmicrosoft.com" to "Enabled" using the GUID "a1b2c3d4-e5f6-g7h8-i9j0-k1l2m3n4o5p6".


#>
function Set-CIPPCAPolicy {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [ValidateSet('Enabled', 'Disabled', 'enabledForReportingButNotEnforced')]
        [string]$State,
        [Parameter(Mandatory = $true)]
        [guid]$Guid
    )

    Write-Verbose "Editing CA Policy for tenant $CustomerTenantID"
    $endpoint = '/api/EditCAPolicy'
    $body = @{
        tenantFilter = $CustomerTenantID
        State        = $State
        GUID         = $Guid
    }
    
    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
