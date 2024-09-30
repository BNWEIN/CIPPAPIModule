<#
.SYNOPSIS
Retrieves the Known IP Database for a specific customer tenant.

.DESCRIPTION
The Get-CIPPKnownIPDB function retrieves the Known IP Database for a specific customer tenant by making a REST API call to the "/api/listknownipdb" endpoint.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant for which to retrieve the Known IP Database.

.EXAMPLE
Get-CIPPKnownIPDB -CustomerTenantID "12345678"
Retrieves the Known IP Database for the customer tenant with ID "12345678".

.INPUTS
None.

.OUTPUTS
System.Object

.NOTES
This function requires the Invoke-CIPPRestMethod function to be available.

.LINK
Invoke-CIPPRestMethod
#>
function Get-CIPPKnownIPDB {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting Known IP Database for $CustomerTenantID"
    $endpoint = '/api/listknownipdb'
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}