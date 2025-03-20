<#
.SYNOPSIS
Retrieves the mail quarantine for a specific customer tenant.

.DESCRIPTION
The Get-CIPPMailQuarantine function retrieves the mail quarantine for a specific customer tenant by making a REST API call to the "/api/listmailquarantine" endpoint.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to retrieve the mail quarantine.

.EXAMPLE
Get-CIPPMailQuarantine -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves the mail quarantine for the customer tenant with the ID "contoso.onmicrosoft.com".

#>
function Get-CIPPMailQuarantine {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Getting mail quarantine for $CustomerTenantID"
    $endpoint = '/api/listmailquarantine'
    $params = @{
        tenantFilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}