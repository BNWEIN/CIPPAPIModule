<#
.SYNOPSIS
Retrieves the MFA users for a specified customer tenant ID.

.DESCRIPTION
The Get-CIPPMFAUsers function retrieves the MFA users for a specified customer tenant ID by making a REST API call to the "/api/listmfausers" endpoint.

.PARAMETER CustomerTenantID
Specifies the customer tenant ID for which to retrieve the MFA users.

.EXAMPLE
Get-CIPPMFAUsers -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves the MFA users for the customer tenant ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
function Get-CIPPMFAUsers {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting MFA users for $CustomerTenantID"
    $endpoint = '/api/listmfausers'
    $params = @{
        tenantFilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}