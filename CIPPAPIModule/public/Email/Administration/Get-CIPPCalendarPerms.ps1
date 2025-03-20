<#
.SYNOPSIS
Retrieves calendar permissions for a user in a specified customer tenant.

.DESCRIPTION
The Get-CIPPCalendarPerms function retrieves the calendar permissions for a user in a specified customer tenant using the CIPP API. It sends a request to the "/api/listcalendarpermissions" endpoint with the provided customer tenant ID and user ID.

.PARAMETER CustomerTenantID
The ID of the customer tenant.

.PARAMETER UserID
The ID of the user.

.EXAMPLE
Get-CIPPCalendarPerms -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "john.doe@example.com"
Retrieves the calendar permissions for the user "john.doe@example.com" in the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>

function Get-CIPPCalendarPerms {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID
    )

    Write-Verbose "Getting user calendar permissions for user: $UserID"
    $Endpoint = '/api/listcalendarpermissions'
    $Params = @{
        tenantFilter = $CustomerTenantID
        userId       = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params
}
