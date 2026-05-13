<#
.SYNOPSIS
Sets the password expiration policy for a specified user.

.DESCRIPTION
The Set-CIPPPasswordNeverExpires function configures the password policy for a specified user in the customer's tenant. This function allows you to set whether the user's password expires or never expires by modifying the user's password policies in Azure Active Directory.

.PARAMETER CustomerTenantID
Specifies the customer tenant ID. This parameter is mandatory.

.PARAMETER UserId
Specifies the unique identifier (GUID) of the user. This parameter is mandatory.

.PARAMETER UserPrincipalName
Specifies the User Principal Name of the user. This parameter is used for logging and display purposes.

.PARAMETER PasswordPolicy
Specifies the password policy to apply. Valid values are 'DisablePasswordExpiration' (password never expires), 'None' (password expires according to tenant policy). This parameter is mandatory.

.EXAMPLE
Set-CIPPPasswordNeverExpires -CustomerTenantID "contoso.onmicrosoft.com" -UserId "12345678-1234-1234-1234-123456789abc" -UserPrincipalName "john.doe@contoso.com" -PasswordPolicy "DisablePasswordExpiration"

Sets the password policy for john.doe@contoso.com to never expire.

.EXAMPLE
Set-CIPPPasswordNeverExpires -CustomerTenantID "contoso.onmicrosoft.com" -UserId "12345678-1234-1234-1234-123456789abc" -UserPrincipalName "jane.smith@contoso.com" -PasswordPolicy "None"

Sets the password policy for jane.smith@contoso.com to expire according to the tenant's default policy.

.NOTES
This function requires appropriate permissions to modify user password policies in Azure Active Directory.
#>

function Set-CIPPPasswordNeverExpires {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [guid]$UserId,
        [Parameter(Mandatory = $false)]
        [string]$UserPrincipalName,
        [Parameter(Mandatory = $true)]
        [ValidateSet('DisablePasswordExpiration', 'None')]
        [string]$PasswordPolicy
    )

    Write-Verbose "Setting password policy for user $UserId to $PasswordPolicy"

    $endpoint = '/api/ExecPasswordNeverExpires'
    $body = @{
        tenantFilter      = $CustomerTenantID
        userId            = $UserId
        userPrincipalName = $UserPrincipalName
        PasswordPolicy    = $PasswordPolicy
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
