<#
.SYNOPSIS
Resets the password for a user in the CIPP system.

.DESCRIPTION
The Set-CIPPResetPassword function is used to reset the password for a user in the CIPP system. It sends a request to the CIPP API to reset the password for the specified user.

.PARAMETER CustomerTenantID
The ID of the customer tenant in the CIPP system.

.PARAMETER UserID
The ID of the user whose password needs to be reset.

.PARAMETER MustChange
Specifies whether the user must change their password upon next login. The default value is "true".

.EXAMPLE
Set-CIPPResetPassword -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "user@domain.com" -MustChange "false"
Resets the password for the user with ID "user@domain.com" in the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778". The user will not be required to change their password upon next login.

#>
function Set-CIPPResetPassword {
    [CmdletBinding()]
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
        [string]$MustChange = 'true'
    )
    
    Write-Verbose "Resetting password for $UserID"

    $endpoint = '/api/execresetpass'
    $params = @{
        tenantfilter = $CustomerTenantID
        Id           = $UserID
        MustChange   = $MustChange
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
