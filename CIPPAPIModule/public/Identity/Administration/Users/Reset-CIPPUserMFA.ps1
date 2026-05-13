<#
.SYNOPSIS
Resets the Multi-Factor Authentication (MFA) for a specified user.

.DESCRIPTION
The Reset-CIPPUserMFA function resets the MFA authentication methods for a specified user in the customer's tenant. This forces the user to re-register their MFA methods on their next sign-in. This is useful when a user has lost access to their MFA device or needs to reconfigure their authentication methods.

.PARAMETER CustomerTenantID
Specifies the customer tenant ID. This parameter is mandatory.

.PARAMETER UserPrincipalName
Specifies the User Principal Name of the user whose MFA will be reset. This parameter is mandatory.

.EXAMPLE
Reset-CIPPUserMFA -CustomerTenantID "contoso.onmicrosoft.com" -UserPrincipalName "john.doe@contoso.com"

Resets the MFA authentication methods for john.doe@contoso.com, requiring them to re-register MFA on their next sign-in.

.EXAMPLE
Reset-CIPPUserMFA -CustomerTenantID "7a90b7e8-5f9a-4c3d-8b2e-1a3f5c7d9e2b" -UserPrincipalName "jane.smith@contoso.com"

Resets the MFA authentication methods for jane.smith@contoso.com using the tenant GUID.

.NOTES
This function requires appropriate permissions to reset user MFA in Azure Active Directory. After resetting MFA, the user will be prompted to set up their authentication methods on their next sign-in.
#>

function Reset-CIPPUserMFA {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserPrincipalName
    )

    Write-Verbose "Resetting MFA for user $UserPrincipalName"

    $endpoint = '/api/ExecResetMFA'
    $body = @{
        tenantFilter = $CustomerTenantID
        ID           = $UserPrincipalName
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
