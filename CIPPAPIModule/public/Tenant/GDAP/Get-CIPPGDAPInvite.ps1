<#
.SYNOPSIS
Gets GDAP invites.

.DESCRIPTION
The Get-CIPPGDAPInvite function retrieves Granular Delegated Admin Privileges (GDAP) invites from CIPP.

.PARAMETER RelationshipId
Optional. The specific relationship ID to retrieve. If not specified, returns all invites.

.EXAMPLE
Get-CIPPGDAPInvite
Returns all GDAP invites.

.EXAMPLE
Get-CIPPGDAPInvite -RelationshipId "12345678-1234-1234-1234-1234567890AB"
Returns the specific GDAP invite for the given relationship ID.

.NOTES
Requires Tenant.Relationship.Read permissions.
#>

function Get-CIPPGDAPInvite {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $false)]
        [string]$RelationshipId
    )

    Write-Verbose 'Getting GDAP invites'

    $endpoint = '/api/ListGDAPInvite'
    $params = @{}

    if ($RelationshipId) {
        Write-Verbose "Filtering for relationship ID: $RelationshipId"
        $params['RelationshipId'] = $RelationshipId
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}