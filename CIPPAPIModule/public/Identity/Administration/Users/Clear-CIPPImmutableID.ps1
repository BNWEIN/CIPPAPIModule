<#
.SYNOPSIS
Clears the Immutable ID for a user in a specified tenant.

.DESCRIPTION
The Clear-CIPPImmutableID function removes the Immutable ID attribute from a user account in a specified tenant.
This is commonly used when migrating users or fixing synchronization issues between on-premises Active Directory and Azure AD.

.PARAMETER CustomerTenantID
The tenant ID of the customer where the user exists.
This parameter is mandatory and should be in the format of a domain name (e.g., "contoso.onmicrosoft.com") or the tenant ID.

.PARAMETER UserID
The ID of the user whose Immutable ID will be cleared. Can be either the user's UserPrincipalName (UPN) or their GUID.
This parameter is mandatory.

.EXAMPLE
Clear-CIPPImmutableID -CustomerTenantID "contoso.onmicrosoft.com" -UserID "user@contoso.com"
Clears the Immutable ID for the specified user in the Contoso tenant.

.EXAMPLE
Set-CIPPClrImmID -CustomerTenantID "fabrikam.onmicrosoft.com" -UserID "12345678-1234-1234-1234-123456789012"
Uses the alias to clear the Immutable ID for the user with the specified GUID in the Fabrikam tenant.

.NOTES
This function calls the CIPP API endpoint '/api/ExecClrImmId' to perform the operation.
Requires appropriate permissions to modify user attributes in the specified tenant.

.LINK
https://docs.cipp.app/
#>

function Clear-CIPPImmutableID {
    [CmdletBinding()]
    [Alias('Set-CIPPClrImmID')]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID
    )

    Write-Verbose "Clearing Immutable ID for User: $UserID"

    $endpoint = '/api/ExecClrImmId'
    $body = @{
        tenantFilter = $CustomerTenantID
        Id           = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
