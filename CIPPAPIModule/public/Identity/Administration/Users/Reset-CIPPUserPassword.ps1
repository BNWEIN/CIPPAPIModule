<#
.SYNOPSIS
    Resets the password for a user in a Microsoft 365 tenant.
.DESCRIPTION
    The Reset-CIPPUserPassword function resets the password for a specified user in a Microsoft 365 tenant.
    The function uses the CIPP API to perform the password reset operation.
.PARAMETER CustomerTenantID
    The tenant ID of the Microsoft 365 tenant where the user resides.
.PARAMETER UserID
    The ID of the user whose password will be reset.
.PARAMETER MustChange
    Specifies whether the user must change their password at next logon.
    Valid values are 'true' or 'false'. Default is 'true'.

.PARAMETER DisplayName
    The display name of the user. If not specified, the UserID will be used as the display name.
.EXAMPLE
    Reset-CIPPUserPassword -CustomerTenantID '12345678-1234-1234-1234-1234567890ab' -UserID 'user@example.com'
    Resets the password for user@example.com and requires the user to change their password at next logon.
.EXAMPLE
    Reset-CIPPUserPassword -CustomerTenantID '12345678-1234-1234-1234-1234567890ab' -UserID 'user@example.com' -MustChange 'false'
    Resets the password for user@example.com and does not require the user to change their password at next logon.
.NOTES
    This function calls the CIPP API endpoint '/api/ExecResetPass' to perform the password reset.
.LINK
    Invoke-CIPPRestMethod
.FUNCTIONALITY
    Identity Management
#>
function Reset-CIPPUserPassword {
    [CmdletBinding()]
    [Alias('Set-CIPPResetPassword')]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID,
        [Parameter(Mandatory = $false)]
        [ValidateSet(
            'true',
            'false' 
        )]
        [string]$MustChange = 'true',
        [Parameter(Mandatory = $false)]
        [string]$DisplayName = $UserID
    )
    
    Write-Verbose "Resetting password for $UserID with display name $DisplayName"

    $endpoint = '/api/ExecResetPass'
    $Body = @{
        tenantFilter = $CustomerTenantID
        Id           = $UserID
        MustChange   = $MustChange
        displayName  = $DisplayName
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $Body -Method POST
}