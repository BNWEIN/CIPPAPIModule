<#
.SYNOPSIS
Retrieves the Defender state for a specific customer.

.DESCRIPTION
The Get-CIPPDefenderState function retrieves the Defender state for a specific customer identified by their tenant ID.

.PARAMETER CustomerTenantID
Specifies the tenant ID of the customer for whom the Defender state needs to be retrieved.

.EXAMPLE
Get-CIPPDefenderState -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves the Defender state for the customer with the specified tenant ID.

#>
function Get-CIPPDefenderState {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [Guid]$CustomerTenantID
    )
    
    Write-Verbose "Getting Defender State for customer: $CustomerTenantID"
    $endpoint = "/api/listdefenderstate"
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params

}