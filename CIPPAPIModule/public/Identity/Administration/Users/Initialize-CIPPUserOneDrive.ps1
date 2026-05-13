<#
.SYNOPSIS
Initializes a OneDrive personal site for a specified user.

.DESCRIPTION
The Initialize-CIPPUserOneDrive function initializes a OneDrive personal site for a specified user in the customer's tenant. This function sends a request to provision a SharePoint Online personal site for the user, which creates their OneDrive for Business storage.

.PARAMETER CustomerTenantID
Specifies the customer tenant ID. This parameter is mandatory.

.PARAMETER UserPrincipalName
Specifies the User Principal Name (email address) of the user for whom to initialize OneDrive. This parameter is mandatory.

.EXAMPLE
Initialize-CIPPUserOneDrive -CustomerTenantID "contoso.onmicrosoft.com" -UserPrincipalName "john.doe@contoso.onmicrosoft.com"

Initializes a OneDrive personal site for the user john.doe@contoso.onmicrosoft.com in the contoso.onmicrosoft.com tenant.

.EXAMPLE
Initialize-CIPPUserOneDrive -CustomerTenantID "7a90b7e8-5f9a-4c3d-8b2e-1a3f5c7d9e2b" -UserPrincipalName "jane.smith@contoso.com"

Initializes a OneDrive personal site for the user jane.smith@contoso.com using the tenant GUID.

.NOTES
This function requires appropriate permissions to provision SharePoint Online personal sites.
#>

function Initialize-CIPPUserOneDrive {
    [CmdletBinding()]
    [Alias('Set-CIPPPreProvisionOneDrive')]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserPrincipalName
    )

    Write-Verbose "Initializing OneDrive for $UserPrincipalName"

    $endpoint = '/api/ExecOneDriveProvision'
    $body = @{
        tenantFilter      = $CustomerTenantID
        UserPrincipalName = $UserPrincipalName
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
