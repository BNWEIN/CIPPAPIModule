<#
.SYNOPSIS
Removes a spam filter rule and policy.

.DESCRIPTION
The Remove-CIPPSpamFilter function removes a specified spam filter rule and its associated policy from Exchange in CIPP.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER Name
Specifies the name of the spam filter rule and policy to remove.

.EXAMPLE
Remove-CIPPSpamFilter -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -Name "Block Spam Policy"
Removes the specified spam filter rule and policy from the specified tenant.

.NOTES
Requires appropriate permissions to manage Exchange spam filter rules and policies.
#>

function Remove-CIPPSpamFilter {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true)]
        [string]$Name
    )

    Write-Verbose "Removing spam filter rule and policy '$Name' from tenant $CustomerTenantID"

    $endpoint = '/api/RemoveSpamfilter'
    $body = @{
        tenantFilter = $CustomerTenantID
        name         = $Name
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}