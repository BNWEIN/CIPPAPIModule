<#
.SYNOPSIS
Creates a TAP (Temporary Access Passcode) for a user.

.DESCRIPTION
The Set-CIPPCreateTap function is used to create a TAP (Temporary Access Passcode) for a user in the CIPP system. 

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant for which the TAP is being created. This parameter is mandatory.

.PARAMETER UserID
Specifies the ID of the user for whom the TAP is being created. This parameter is mandatory.

.EXAMPLE
Set-CIPPCreateTap -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "user@domain.com"
Creates a TAP for the user with the ID "user@domain.com" in the customer tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
function Set-CIPPCreateTap {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID
    )

    Write-Verbose "Creating TAP for User: $userID"

    $endpoint = '/api/execcreatetap'
    $params = @{
        tenantfilter = $CustomerTenantID
        Id           = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
