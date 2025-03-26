<#
.SYNOPSIS
Retrieves the mailbox rules for a specific user in the CIPP system.

.DESCRIPTION
The Get-CIPPUserMailboxRules function retrieves the mailbox rules for a specific user in the CIPP system. It makes an API call to the "/api/listusermailboxrules" endpoint, passing the customer tenant ID and user ID as parameters.

.PARAMETER CustomerTenantID
The ID of the customer tenant.

.PARAMETER UserID
The ID of the user.

.EXAMPLE
Get-CIPPUserMailboxRules -CustomerTenantID "contoso.onmicrosoft.com" -UserID "user@domain.com"
Retrieves the mailbox rules for the user with the ID "user@domain.com" in the customer tenant with the ID "contoso.onmicrosoft.com".

#>

function Get-CIPPUserMailboxRules {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID
    )
    
    Write-Verbose "Getting user Mailbox Rules for $userID"
    
    $endpoint = '/api/listusermailboxrules'
    $params = @{
        tenantFilter = $CustomerTenantID
        userId       = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
