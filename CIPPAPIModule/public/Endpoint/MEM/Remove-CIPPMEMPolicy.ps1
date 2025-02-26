<#
.SYNOPSIS
Removes a Microsoft Endpoint Manager (MEM) policy.

.DESCRIPTION
The Remove-CIPPMEMPolicy function removes a specified Microsoft Endpoint Manager policy from CIPP.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER PolicyId
Specifies the ID of the policy to remove.

.PARAMETER UrlName
Specifies the URL name for the policy type in the Graph API (e.g., 'configurationPolicies', 'deviceConfigurations').

.EXAMPLE
Remove-CIPPMEMPolicy -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -PolicyId "98765432-4321-4321-4321-BA0987654321" -UrlName "configurationPolicies"
Removes the specified configuration policy from the specified tenant.

.NOTES
Requires appropriate permissions to manage Microsoft Endpoint Manager policies.
#>

function Remove-CIPPMEMPolicy {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true)]
        [string]$PolicyId,

        [Parameter(Mandatory = $true)]
        [string]$UrlName
    )

    Write-Verbose "Removing MEM policy $PolicyId from tenant $CustomerTenantID"

    $endpoint = '/api/RemovePolicy'
    $body = @{
        tenantFilter = $CustomerTenantID
        ID           = $PolicyId
        URLName      = $UrlName
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method Post
}