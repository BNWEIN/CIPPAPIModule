<#
.SYNOPSIS
Retrieves GDAP access assignments for a specific customer.

.DESCRIPTION
The Get-CIPPGDAPAccessAssignments function retrieves GDAP access assignments for a specific customer identified by their tenant ID.

.PARAMETER Id
The ID of the access assignment to retrieve.

.EXAMPLE
Get-CIPPGDAPAccessAssignments -Id "12345"
Retrieves the GDAP access assignments with the given assignment ID "12345".

.NOTES
Requires appropriate permissions to access GDAP access assignments.
#>

function Get-CIPPGDAPAccessAssignments {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Id
    )

    Write-Verbose "Getting GDAP Access Assignments for ID: $Id"
    $endpoint = '/api/ListGDAPAccessAssignments'
    $params = @{
        Id = $Id
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}