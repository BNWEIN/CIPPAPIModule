<#
.SYNOPSIS
Removes a Conditional Access Policy from a tenant.

.DESCRIPTION
The Remove-CIPPCAPolicy function removes a specified Conditional Access Policy from a tenant in CIPP.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the Conditional Access Policy will be removed.

.PARAMETER PolicyId
Specifies the ID of the Conditional Access Policy to remove.

.EXAMPLE
Remove-CIPPCAPolicy -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -PolicyId "98765432-4321-4321-4321-BA0987654321"
Removes the specified Conditional Access Policy from the specified tenant.

.NOTES
Requires appropriate permissions to manage Conditional Access Policies.
#>

function Remove-CIPPCAPolicy {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        
        [Parameter(Mandatory = $true)]
        [guid]$PolicyId
    )

    Write-Verbose "Removing Conditional Access Policy $PolicyId"

    $endpoint = '/api/RemoveCAPolicy'
    $body = @{
        tenantFilter = $CustomerTenantID
        GUID         = $PolicyId
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}