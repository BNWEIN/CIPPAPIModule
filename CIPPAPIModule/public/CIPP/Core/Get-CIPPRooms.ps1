<#
.SYNOPSIS
Retrieves rooms for a specific customer tenant.

.DESCRIPTION
The Get-CIPPRooms function retrieves rooms for a specific customer tenant by making a REST API call to the "/api/listrooms" endpoint.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant.

.EXAMPLE
Get-CIPPRooms -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves rooms for the customer tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
function Get-CIPPRooms {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [string]$RoomID

    )

    Write-Verbose "Retrieving rooms for tenant $CustomerTenantID"
    $Endpoint = '/api/ListRooms'
    $Params = @{
        tenantFilter = $CustomerTenantID
        RoomID       = $RoomID
    }

    Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params
}