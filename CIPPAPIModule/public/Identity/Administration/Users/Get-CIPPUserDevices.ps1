<#
.SYNOPSIS
Retrieves the devices associated with a specific user.

.DESCRIPTION
The Get-CIPPUserDevices function retrieves the devices associated with a specific user in the CIPP system. It makes a REST API call to the "/api/listuserdevices" endpoint, passing the customer tenant ID and user ID as parameters.

.PARAMETER CustomerTenantID
The ID of the customer tenant.

.PARAMETER UserID
The ID of the user.

.EXAMPLE
Get-CIPPUserDevices -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "user1@domain.com"
Retrieves the devices associated with the user "user1@domain.com" in the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>

function Get-CIPPUserDevices {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID
    )
    
    Write-Verbose "Getting user devices for $userID"
    
    $endpoint = '/api/listuserdevices'
    $params = @{
        tenantfilter = $CustomerTenantID
        userId       = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
