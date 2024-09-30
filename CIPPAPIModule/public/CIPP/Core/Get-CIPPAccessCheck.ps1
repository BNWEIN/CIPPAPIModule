<#
.SYNOPSIS
    Performs a tenant access check for the specified customer tenant ID.

.DESCRIPTION
    The Get-CIPPAccessCheck function performs a tenant access check for the specified customer tenant ID. It sends a POST request to the "/api/execaccesschecks" endpoint with the provided tenant ID.

.PARAMETER CustomerTenantID
    Specifies the customer tenant ID for which the access check needs to be performed.

.EXAMPLE
    Get-CIPPAccessCheck -CustomerTenantID "87654321-4321-4321-4321-0987654321BA"
    Runs a tenant access check for the customer tenant ID "87654321-4321-4321-4321-0987654321BA".

#>
function Get-CIPPAccessCheck {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string[]]$CustomerTenantID
    )

    Write-Verbose "Running tenant access check for $CustomerTenantID"
    $Endpoint = '/api/execaccesschecks'

    $params = @{
        tenants = 'true'
    }
    $body = @{
        tenantid = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $Endpoint -Body $body -Params $params -Method POST
}
