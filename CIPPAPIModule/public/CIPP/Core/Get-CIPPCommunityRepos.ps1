<#
.SYNOPSIS
Retrieves a list of community repositories and adds them to the database if they are missing.

.DESCRIPTION
The Get-CIPPCommunityRepos function retrieves a list of community repositories and adds them to the database if they are missing.

.EXAMPLE
Get-CIPPCommunityRepos 
Retrieves the community repositories

.NOTES
Requires appropriate permissions to access repository information.
#>

function Get-CIPPCommunityRepos {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose 'Getting Community Repositories'
    $endpoint = '/api/ListCommunityRepos'
    $params = @{
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}