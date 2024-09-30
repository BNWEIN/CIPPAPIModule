<#
.SYNOPSIS
Performs a universal search for a specified name.

.DESCRIPTION
The Get-CIPPUniversalSearch function performs a universal search for a specified name by making a REST API call to the /api/execuniversalsearch endpoint.

.PARAMETER Name
The name to search for.

.EXAMPLE
Get-CIPPUniversalSearch -Name "John Doe"
Searches for the name "John Doe" using the universal search functionality.

#>

function Get-CIPPUniversalSearch {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$Name
    )

    Write-Verbose "Searching for $Name"

    $endpoint = '/api/execuniversalsearch'
    $params = @{
        name = $Name
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
