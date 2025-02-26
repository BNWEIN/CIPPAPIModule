<#
.SYNOPSIS
Retrieves mailbox statistics for a specified customer tenant ID.

.DESCRIPTION
The Get-CIPPMailboxStatistics function retrieves mailbox statistics for a specified customer tenant ID by making a REST API call to the "/api/listmailboxstatistics" endpoint.

.PARAMETER CustomerTenantID
Specifies the customer tenant ID for which mailbox statistics need to be retrieved.

.EXAMPLE
Get-CIPPMailboxStatistics -CustomerTenantID "contoso.onmicrosoft.com"
Retrieves mailbox statistics for the customer tenant with the ID "contoso.onmicrosoft.com".

#>
function Get-CIPPMailboxStatistics {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting mailbox statistics for $CustomerTenantID"
    $endpoint = '/api/listmailboxstatistics'
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}