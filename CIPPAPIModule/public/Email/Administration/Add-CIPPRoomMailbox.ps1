<#
.SYNOPSIS
    Adds a room mailbox to a specified tenant.

.DESCRIPTION
    This function adds a room mailbox to a specified tenant by calling the CIPP API endpoint '/api/AddRoomMailbox'.
    It requires the tenant ID, display name, domain, and username as mandatory parameters.
    Optionally, the resource capacity can also be specified.

.PARAMETER CustomerTenantID
    The ID of the customer tenant where the room mailbox will be added.
    Either TenantID or Default domain can be used to identify the tenant.

.PARAMETER DisplayName
    The display name for the room mailbox.

.PARAMETER Domain
    The domain for the room mailbox.

.PARAMETER Username
    The username for the room mailbox.

.PARAMETER ResourceCapacity
    The resource capacity for the room mailbox. This parameter is optional.

.EXAMPLE
    Add-RoomMailbox -CustomerTenantID "7e3effb6-6efe-42f2-b071-48ce318eaf95" -DisplayName "Conference Room 1" -Domain "example.com" -Username "confroom1" -ResourceCapacity 10

.NOTES
    This function uses the Invoke-CIPPRestMethod cmdlet to make a POST request to the CIPP API.
#>
function Add-CIPPRoomMailbox {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$DisplayName,
        [Parameter(Mandatory = $true)]
        [string]$Domain,
        [Parameter(Mandatory = $true)]
        [string]$Username,
        [Parameter(Mandatory = $false)]
        [int]$ResourceCapacity
    )

    Write-Verbose "Adding room mailbox in tenant: $CustomerTenantID"
    $Endpoint = '/api/AddRoomMailbox'
    $body = @{
        tenantID          = $CustomerTenantID
        displayName       = $DisplayName
        username          = $Username
        domain            = $Domain
        userPrincipalName = "$Username@$Domain"
        resourceCapacity  = $ResourceCapacity

    }
    Invoke-CIPPRestMethod -Endpoint $Endpoint -Body $body -Method POST
}
