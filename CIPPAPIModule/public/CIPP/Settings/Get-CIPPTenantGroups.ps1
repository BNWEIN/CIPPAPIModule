<#
.SYNOPSIS
Gets tenant groups from the CIPP API.

.DESCRIPTION
The Get-CIPPTenantGroups function retrieves a list of tenant groups from the CIPP API. It can optionally filter by a specific group ID.

.PARAMETER GroupID
Optional. The ID of the group to filter by.

.EXAMPLE
Get-CIPPTenantGroups
Returns all tenant groups.

.EXAMPLE
Get-CIPPTenantGroups -GroupID "12345678-1234-1234-1234-1234567890AB"
Returns the tenant group with the specified ID.

#>
function Get-CIPPTenantGroups {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)]
        [string]$GroupID
    )

    Write-Verbose 'Retrieving tenant groups'
    $endpoint = '/api/ListTenantGroups'
    $params = @{}

    if ($GroupID) {
        Write-Verbose "Filtering by group ID: $GroupID"
        $params['groupId'] = $GroupID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
