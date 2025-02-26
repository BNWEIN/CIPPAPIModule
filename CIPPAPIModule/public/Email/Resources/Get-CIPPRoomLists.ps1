<#
.SYNOPSIS
Retrieves room lists for a specific customer tenant.

.DESCRIPTION
The Get-CIPPRoomLists function retrieves room lists for a specific customer tenant by making a REST API call to the "/api/listroomlists" endpoint.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant.

.EXAMPLE
Get-CIPPRoomLists -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves room lists for the customer tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
function Get-CIPPRoomLists {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Retrieving room lists for tenant $CustomerTenantID"
    $Endpoint = '/api/ListRoomLists'
    $Params = @{
        tenantFilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params

}