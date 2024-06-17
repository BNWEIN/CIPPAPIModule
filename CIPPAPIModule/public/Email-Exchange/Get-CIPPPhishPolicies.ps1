<#
.SYNOPSIS
Retrieves the phishing policies for a specific customer tenant.

.DESCRIPTION
The Get-CIPPPhishPolicies function retrieves the phishing policies for a specific customer tenant by making a REST API call to the "/api/listphishpolicies" endpoint.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to retrieve the phishing policies.

.EXAMPLE
Get-CIPPPhishPolicies -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves the phishing policies for the customer tenant with the ID "contoso.onmicrosoft.com".

#>
function Get-CIPPPhishPolicies {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Getting Phish Policies for $CustomerTenantID"
    $endpoint = "/api/listphishpolicies"
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
