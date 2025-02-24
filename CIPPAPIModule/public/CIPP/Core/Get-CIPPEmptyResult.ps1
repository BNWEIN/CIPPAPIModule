<#
.SYNOPSIS
Returns an empty result.

.DESCRIPTION
The Get-CIPPEmptyResult function is a utility function that purposely returns an empty array. 
This can be useful for testing, initialization scenarios, or as a placeholder when no data is expected.

.EXAMPLE
Get-CIPPEmptyResult
Returns an empty array.

.NOTES
Requires CIPP.Core permissions.
This is a utility function that always returns an empty array.
#>

function Get-CIPPEmptyResult {
    [CmdletBinding()]
    param()

    Write-Verbose 'Retrieving empty result'

    $endpoint = '/api/ListEmptyResults'
    Invoke-CIPPRestMethod -Endpoint $endpoint -Method GET
}