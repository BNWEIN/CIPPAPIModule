<#
.SYNOPSIS
Retrieves teams voice information for a specified customer tenant ID.

.DESCRIPTION
The Get-CIPPTeamsVoice function retrieves teams voice information for a specified customer tenant ID. It makes use of the Invoke-CIPPRestMethod function to send a request to the "/api/listteamsvoice" endpoint with the provided tenant filter.

.PARAMETER CustomerTenantID
The customer tenant ID for which to retrieve teams voice information. This parameter is mandatory.

.EXAMPLE
Get-CIPPTeamsVoice -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves teams voice information for the customer tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
function Get-CIPPTeamsVoice {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Getting teams voice $CustomerTenantID"
    $endpoint = "/api/listteamsvoice"
    $params = @{
        tenantfilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
