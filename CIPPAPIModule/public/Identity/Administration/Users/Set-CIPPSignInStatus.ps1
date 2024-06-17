<#
.SYNOPSIS
Sets the sign-in status for a user in the CIPP system.

.DESCRIPTION
The Set-CIPPSignInStatus function is used to enable or disable the sign-in status for a user in the CIPP system. 
When the $Enable parameter is set to "true", the function enables sign-in for the specified user. 
When the $Enable parameter is set to "false", the function disables sign-in for the specified user.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant.

.PARAMETER UserID
Specifies the ID of the user.

.PARAMETER Enable
Specifies whether to enable or disable sign-in for the user. 
Valid values are "true" (to enable sign-in) or "false" (to disable sign-in).

.EXAMPLE
Set-CIPPSignInStatus -CustomerTenantID "47b02ab5-376d-4c85-b82d-13996c023c93" -UserID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc" -Enable "true"
Enables sign-in for the user with the ID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc" in the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.EXAMPLE
Set-CIPPSignInStatus -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc" -Enable "false"
Disables sign-in for the user with the ID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc" in the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".
#>
function Set-CIPPSignInStatus {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID,
        [Parameter(Mandatory = $true)]
        [ValidateSet(
            "true",
            "false" 
        )]
        [string]$Enable
    )
    
    if ($Enable -eq "true") {
        Write-Verbose "Enabling signin for $UserID"
    } else {
        Write-Verbose "Disabling signin for $UserID"
    }
    $endpoint = "/api/execdisableuser"
    $params = @{
        tenantfilter = $CustomerTenantID
        Id = $UserID
        Enable = $Enable
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
