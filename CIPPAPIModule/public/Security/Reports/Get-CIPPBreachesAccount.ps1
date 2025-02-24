<#
.SYNOPSIS
Gets account breach information.

.DESCRIPTION
The Get-CIPPBreachesAccount function retrieves information about potential security breaches associated with accounts in CIPP.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER AccountOrDomain
Specifies the account or domain to check for breaches.

.EXAMPLE
Get-CIPPBreachesAccount -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -AccountOrDomain "user@contoso.com"
Retrieves breach information for the specified account.

.EXAMPLE
Get-CIPPBreachesAccount -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -AccountOrDomain "contoso.com"
Retrieves breach information for the specified domain.

.NOTES
Requires appropriate permissions to view security breach information.
#>

function Get-CIPPBreachesAccount {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true)]
        [string]$AccountOrDomain
    )

    Write-Verbose "Getting breach information for $AccountOrDomain in tenant $CustomerTenantID"

    $endpoint = '/api/ListBreachesAccount'
    $params = @{
        tenantFilter = $CustomerTenantID
        account      = $AccountOrDomain
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}