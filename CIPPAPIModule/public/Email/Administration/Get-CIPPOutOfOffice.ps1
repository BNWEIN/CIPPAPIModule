<#
.SYNOPSIS
    Retrieves the out of office status for a specified user.

.DESCRIPTION
    The Get-CIPPOutOfOffice function retrieves the out of office status for a specified user in a customer's tenant.

.PARAMETER CustomerTenantID
    Specifies the ID of the customer's tenant.

.PARAMETER UserID
    Specifies the ID of the user.

.EXAMPLE
    Get-CIPPOutOfOffice -CustomerTenantID "contoso.onmicrosoft.com" -UserID "john.doe@domain.com"
    Retrieves the out of office status for the user with the ID "john.doe@domain.com" in the customer's tenant with the ID "contoso.onmicrosoft.com".

#>
function Get-CIPPOutOfOffice {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID
    )

    Write-Verbose "Getting out of office for $UserID"
    $endpoint = '/api/listooo'
    $params = @{
        tenantfilter = $CustomerTenantID
        userid       = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
