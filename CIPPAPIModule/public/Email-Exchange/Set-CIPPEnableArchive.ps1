<#
.SYNOPSIS
Enables email archiving for a specified user in the CIPP system.

.DESCRIPTION
The Set-CIPPEnableArchive function enables email archiving for a specified user in the CIPP system. It sends a request to the CIPP API to enable email archiving for the user identified by the provided CustomerTenantID and UserID.

.PARAMETER CustomerTenantID
The unique identifier of the customer tenant.

.PARAMETER UserID
The unique identifier of the user.

.EXAMPLE
Set-CIPPEnableArchive -CustomerTenantID "contoso.onmicrosoft.com" -UserID "user@domain.com"
Enables email archiving for the user with the CustomerTenantID "contoso.onmicrosoft.com" and UserID "user@domain.com".

#>

function Set-CIPPEnableArchive {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID
    )
    
    
    Write-Verbose "Enabling Email Archive for $userID"
    
    $endpoint = '/api/execenablearchive'
    $params = @{
        tenantfilter = $CustomerTenantID
        id           = $UserID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}