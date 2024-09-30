<#
.SYNOPSIS
Retrieves the list of excluded licenses from CIPP.

.DESCRIPTION
The Get-CIPPExcludedLicenses function is used to retrieve the list of excluded licenses from CIPP. It sends a request to the API endpoint "/api/execexcludelicenses" with the parameter "List" set to "true" to get the excluded license list.

.PARAMETER None
This function does not accept any parameters.

.EXAMPLE
Get-CIPPExcludedLicenses
# Retrieves the list of excluded licenses from the CIPP API.

.NOTES
This function requires the Invoke-CIPPRestMethod function to be available in the current session.
#>

function Get-CIPPExcludedLicenses {
    [CmdletBinding()]
    Param()

    Write-Verbose 'Getting Excluded License List'

    $endpoint = '/api/execexcludelicenses'
    $params = @{
        List = 'true'
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
