<#
.SYNOPSIS
Gets Teams LIS locations.

.DESCRIPTION
The Get-CIPPTeamsLisLocation function retrieves Location Information Service (LIS) locations for Teams emergency services from CIPP.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.EXAMPLE
Get-CIPPTeamsLisLocation -CustomerTenantID "12345678-1234-1234-1234-1234567890AB"
Returns all LIS locations configured for Teams in the specified tenant.

.NOTES
Requires Teams.Voice.Read permissions.
LIS locations are used for emergency services to determine caller location.
#>

function Get-CIPPTeamsLisLocation {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting Teams LIS locations for tenant $CustomerTenantID"

    $endpoint = '/api/ListTeamsLisLocation'
    $params = @{
        tenantFilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}