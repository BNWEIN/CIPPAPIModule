<#
.SYNOPSIS
Retrieves Conditional Access Policies for a specific customer tenant.

.DESCRIPTION
The Get-CIPPCAPolicies function retrieves the Conditional Access Policies for a specific customer tenant by making a REST API call to the "/api/listconditionalaccesspolicies" endpoint.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to retrieve the Conditional Access Policies.

.EXAMPLE
Get-CIPPCAPolicies -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Retrieves the Conditional Access Policies for the customer tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.EXAMPLE
Get-CIPPCAPolicies -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves the Conditional Access Policies for the customer tenant with the ID "contoso.onmicrosoft.com".

#>
function Get-CIPPCAPolicies {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting Conditional Access Policies for customer: $CustomerTenantID"
    $Endpoint = "/api/listconditionalaccesspolicies"
    $Params = @{
        tenantfilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params

}