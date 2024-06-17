<#
.SYNOPSIS
Retrieves Intune Intents for a specific customer.

.DESCRIPTION
The Get-CIPPIntuneIntents function retrieves Intune Intents for a specific customer based on the provided CustomerTenantID.

.PARAMETER CustomerTenantID
Specifies the ID of the customer's tenant.

.EXAMPLE
Get-CIPPIntuneIntents -CustomerTenantID "contoso.onmicrosoft.com"
This example retrieves Intune Intents for the customer with the tenant ID "contoso.onmicrosoft.com".

.EXAMPLE
Get-CIPPIntuneIntents -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
This example retrieves Intune Intents for the customer with the tenant ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
Function Get-CIPPIntuneIntents {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting Intune Intents for customer: $CustomerTenantID"
    
    # Define the endpoint and parameters
    $endpoint = "/api/listintuneintents"
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    
    # Use the Invoke-CIPPRequest function to make the request
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}