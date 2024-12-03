<#
.SYNOPSIS
Removes standards for a specified customer domain.

.DESCRIPTION
The Remove-CIPPStandard function removes standards associated with a given customer domain by calling the appropriate API endpoint.

.PARAMETER CustomerDefaultDomain
The default domain of the customer for which the standards are to be removed. This parameter is mandatory.

.EXAMPLE
Remove-CIPPStandard -CustomerDefaultDomain "example.com"
This example removes the standards for the customer with the default domain "example.com".

.NOTES
This function uses the Invoke-CIPPRestMethod cmdlet to call the API endpoint.
#>
function Remove-CIPPStandard {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerDefaultDomain
    )
    
    Write-Verbose "Removing standards for $CustomerTenantID"
    $endpoint = '/api/RemoveStandard'
    $params = @{
        ID = $CustomerDefaultDomain
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
