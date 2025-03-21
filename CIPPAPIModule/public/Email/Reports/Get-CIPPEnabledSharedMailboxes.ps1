<#
.SYNOPSIS
Retrieves shared mailboxes with account enabled for a specific customer tenant ID.

.DESCRIPTION
The Get-CIPPEnabledSharedMailboxes function retrieves shared mailboxes with account enabled for a specific customer tenant ID. It makes use of the Invoke-CIPPRestMethod function to send a request to the CIPP API and retrieve the shared mailboxes.

.PARAMETER CustomerTenantID
Specifies the customer tenant ID for which to retrieve the shared mailboxes.

.EXAMPLE
Get-CIPPEnabledSharedMailboxes -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves shared mailboxes with account enabled for the "contoso.onmicrosoft.com" customer tenant ID.

#>
function Get-CIPPEnabledSharedMailboxes {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting shared mailboxes with account enabled for $CustomerTenantID"
    $endpoint = '/api/listsharedmailboxaccountenabled'
    $params = @{
        tenantFilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
