<#
.SYNOPSIS
    Retrieves Defender TVM for a specific customer.

.DESCRIPTION
    The Get-CIPPDefenderTVM function retrieves the Defender TVM (Threat and Vulnerability Management) for a specific customer based on the provided CustomerTenantID.

.PARAMETER CustomerTenantID
    Specifies the unique identifier of the customer's tenant.

.EXAMPLE
    Get-CIPPDefenderTVM -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
    Retrieves the Defender TVM for the customer with the tenant ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".
#>

function Get-CIPPDefenderTVM {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Getting Defender TVM for customer: $CustomerTenantID"
    $endpoint = "/api/listdefendertvm"
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}