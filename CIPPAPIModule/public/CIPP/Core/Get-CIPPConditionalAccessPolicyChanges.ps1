<#
.SYNOPSIS
Retrieves conditional access policy changes for a specific customer.

.DESCRIPTION
The Get-CIPPConditionalAccessPolicyChanges function retrieves conditional access policy changes for a specific customer identified by their tenant ID.

.PARAMETER CustomerTenantID
The tenant ID of the customer for whom to retrieve the conditional access policy changes.

.PARAMETER PolicyId
The ID of the policy for which to retrieve changes.

.PARAMETER PolicyDisplayName
The display name of the policy for which to retrieve changes.

.EXAMPLE
Get-CIPPConditionalAccessPolicyChanges -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -PolicyId "12345" -PolicyDisplayName "Example Policy"
Retrieves the conditional access policy changes for the policy with ID "12345" and display name "Example Policy" for the customer with the tenant ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.NOTES
Requires appropriate permissions to access conditional access policy information.
#>

function Get-CIPPConditionalAccessPolicyChanges {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $false)]
        [string]$PolicyId,

        [Parameter(Mandatory = $false)]
        [string]$PolicyDisplayName
    )

    Write-Verbose "Getting Conditional Access Policy Changes for customer: $CustomerTenantID"
    $endpoint = '/api/ListConditionalAccessPolicyChanges'
    $params = @{
        tenantFilter = $CustomerTenantID
        id           = $PolicyId
        displayName  = $PolicyDisplayName
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}