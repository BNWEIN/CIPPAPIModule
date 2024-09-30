<#
.SYNOPSIS
Retrieves the roles for a specific customer tenant ID.

.DESCRIPTION
The Get-CIPPRoles function retrieves the roles associated with a specific customer tenant ID by making a REST API call to the "/api/listroles" endpoint.

.PARAMETER CustomerTenantID
The customer tenant ID for which to retrieve the roles.

.EXAMPLE
Get-CIPPRoles -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves the roles for the customer tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
function Get-CIPPRoles {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Getting roles for $CustomerTenantID"
    $endpoint = '/api/listroles'
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
