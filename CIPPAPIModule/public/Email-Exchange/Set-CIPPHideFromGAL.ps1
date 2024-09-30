<#
.SYNOPSIS
Sets the "hide from Global Address List (GAL)" property for a user in a customer's tenant.

.DESCRIPTION
The Set-CIPPHideFromGAL function is used to set the "hide from GAL" property for a specified user in a customer's tenant. This property determines whether the user's email address is visible in the Global Address List (GAL) or not.

.PARAMETER CustomerTenantID
Specifies the ID of the customer's tenant.

.PARAMETER UserID
Specifies the ID of the user for whom the "hide from GAL" property needs to be set.

.PARAMETER hidefromgal
Specifies whether the user's email address should be hidden from the GAL or not. Valid values are 'true' and 'false'.

.EXAMPLE
Set-CIPPHideFromGAL -CustomerTenantID "contoso.onmicrosoft.com" -UserID "user1@example.com" -hidefromgal "true"
Sets the "hide from GAL" property to true for the user with the email address "user1@example.com" in the customer's tenant with ID "contoso.onmicrosoft.com".

.EXAMPLE
Set-CIPPHideFromGAL -CustomerTenantID "contoso.onmicrosoft.com" -UserID "user2@example.com" -hidefromgal "false"
Sets the "hide from GAL" property to false for the user with the email address "user2@example.com" in the customer's tenant with ID "contoso.onmicrosoft.com".
#>
function Set-CIPPHideFromGAL {
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID,
        [Parameter(Mandatory = $true)]
        [validateset(
            'true',
            'false'
        )]
        [string]$hidefromgal
    )

    Write-Verbose "Setting hide from GAL to $hidefromgal for $UserID"

    $endpoint = '/api/exechidefromgal'
    $params = @{
        tenantfilter = $CustomerTenantID
        id           = $UserID
        hidefromgal  = $hidefromgal
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
    
}