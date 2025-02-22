<#
.SYNOPSIS
Retrieves the mailbox details for a specific user in the CIPP system.

.DESCRIPTION
The Get-CIPPUserMailboxDetails function retrieves the mailbox details for a specific user in the CIPP system. It makes an API call to the "/api/listusermailboxdetails" endpoint, passing the customer tenant ID and user ID as parameters.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to retrieve the mailbox details.

.PARAMETER UserID
The ID of the user for which to retrieve the mailbox details.

.EXAMPLE
Get-CIPPUserMailboxDetails -CustomerTenantID "contoso.onmicrosoft.com" -UserID "user@domain.com"
Retrieves the mailbox details for the user with ID "user@domain.com" in the customer tenant with ID "contoso.onmicrosoft.com".

#>

function Get-CIPPUserMailboxDetails {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID
    )
    
    Write-Verbose "Getting user Mailbox Details for $userID"
    
    $endpoint = '/api/listusermailboxdetails'
    $params = @{
        tenantfilter = $CustomerTenantID
        userId       = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
