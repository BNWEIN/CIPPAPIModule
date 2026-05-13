<#
.SYNOPSIS
Sets the per-user MFA state for a specified user.

.DESCRIPTION
The Set-CIPPPerUserMFA function configures the per-user Multi-Factor Authentication (MFA) state for a specified user in the customer's tenant. This function allows you to enable, disable, or enforce MFA for individual users using the legacy per-user MFA settings.

.PARAMETER CustomerTenantID
Specifies the customer tenant ID. This parameter is mandatory.

.PARAMETER UserId
Specifies the unique identifier (GUID) of the user. Either UserPrincipalName or UserId must be specified.

.PARAMETER UserPrincipalName
Specifies the User Principal Name of the user. Either UserPrincipalName or UserId must be specified.

.PARAMETER State
Specifies the MFA state to set. Valid values are 'Enabled', 'Disabled', and 'Enforced'. This parameter is mandatory.

.EXAMPLE
Set-CIPPPerUserMFA -CustomerTenantID "contoso.onmicrosoft.com" -UserPrincipalName "john.doe@contoso.com" -State "Enabled"

Enables per-user MFA for john.doe@contoso.com.

.EXAMPLE
Set-CIPPPerUserMFA -CustomerTenantID "contoso.onmicrosoft.com" -UserPrincipalName "jane.smith@contoso.com" -State "Enforced"

Enforces per-user MFA for jane.smith@contoso.com, requiring MFA on every sign-in.

.EXAMPLE
Set-CIPPPerUserMFA -CustomerTenantID "contoso.onmicrosoft.com" -UserId "12345678-1234-1234-1234-123456789abc" -State "Enabled"

Enables per-user MFA using the UserId instead of UserPrincipalName.

.EXAMPLE
Set-CIPPPerUserMFA -CustomerTenantID "contoso.onmicrosoft.com" -UserPrincipalName "bob.jones@contoso.com" -State "Disabled"

Disables per-user MFA for bob.jones@contoso.com.

.NOTES
This function configures legacy per-user MFA settings. Consider using Conditional Access policies for more granular control.
#>

function Set-CIPPPerUserMFA {
    [CmdletBinding(DefaultParameterSetName = 'UPN')]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true, ParameterSetName = 'ID')]
        [guid]$UserId,
        [Parameter(Mandatory = $true, ParameterSetName = 'UPN')]
        [string]$UserPrincipalName,
        [Parameter(Mandatory = $true)]
        [ValidateSet('Enabled', 'Disabled', 'Enforced')]
        [string]$State
    )

    $identifier = if ($PSBoundParameters.ContainsKey('UserPrincipalName')) { $UserPrincipalName } else { $UserId }
    Write-Verbose "Setting per-user MFA state to $State for $identifier"

    $endpoint = '/api/ExecPerUserMFA'
    $body = @{
        tenantFilter = $CustomerTenantID
        State        = $State
    }

    if ($PSBoundParameters.ContainsKey('UserPrincipalName')) {
        $body['userPrincipalName'] = $UserPrincipalName
    }

    if ($PSBoundParameters.ContainsKey('UserId')) {
        $body['userId'] = $UserId
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
