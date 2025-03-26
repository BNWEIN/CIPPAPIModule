<#
.SYNOPSIS
Retrieves mailbox rules for a specified customer tenant ID.

.DESCRIPTION
The Get-CIPPMailboxRules function retrieves mailbox rules for a specified customer tenant ID by making a REST API call to the "/api/listmailboxrules" endpoint.

.PARAMETER CustomerTenantID
The customer tenant ID for which to retrieve mailbox rules.

.EXAMPLE
Get-CIPPMailboxRules -CustomerTenantID "contoso.onmicrosoft.com"

This example retrieves mailbox rules for the customer tenant with the ID "contoso.onmicrosoft.com".

#>
function Get-CIPPMailboxRules {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Getting mailbox rules for $CustomerTenantID"
    $endpoint = '/api/listmailboxrules'
    $params = @{
        tenantFilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
