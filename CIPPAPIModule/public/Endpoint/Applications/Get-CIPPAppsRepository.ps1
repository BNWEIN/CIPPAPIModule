<#
.SYNOPSIS
Searches for applications in a package repository.

.DESCRIPTION
The Get-CIPPAppsRepository function searches for applications in a specified package repository (defaults to chocolatey.org). 
It returns detailed information about found packages including package name, author, version, and description.

.PARAMETER Search
Specifies the search term to find packages. This parameter is mandatory.

.PARAMETER Repository
Specifies the repository URL to search in. If not specified, defaults to 'https://chocolatey.org/api/v2'.

.EXAMPLE
Get-CIPPAppsRepository -Search 'chrome'
Returns a list of packages matching 'chrome' from the default Chocolatey repository.

.EXAMPLE
Get-CIPPAppsRepository -Search 'firefox' -Repository 'https://custom.repository/api/v2'
Returns a list of packages matching 'firefox' from the specified custom repository.

.NOTES
Having this function doesn't really make sense, but hey it's here now. 
#>

function Get-CIPPAppsRepository {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$Search,
        
        [Parameter(Mandatory = $false)]
        [string]$Repository = 'https://chocolatey.org/api/v2'
    )

    $endpoint = '/api/ListAppsRepository'
    $body = @{
        Search     = $Search
        Repository = $Repository
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Method POST -Body $body
}