<#
.SYNOPSIS
Synchronizes DEP (Apple Device Enrollment Program) tokens for a specified customer tenant.

.DESCRIPTION
The Sync-CIPPDEPTokens function synchronizes DEP onboarding settings for a specified customer tenant. It uses the Invoke-CIPPRestMethod function to make a REST API call to start the DEP sync process for all DEP onboarding settings in the tenant.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to synchronize DEP tokens. This parameter is mandatory.

.EXAMPLE
Sync-CIPPDEPTokens -CustomerTenantID "contoso.onmicrosoft.com"
Synchronizes DEP tokens for the customer tenant "contoso.onmicrosoft.com".

.EXAMPLE
Sync-CIPPDEPTokens -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
Synchronizes DEP tokens for the customer tenant with the specified GUID.
#>

function Sync-CIPPDEPTokens {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Starting DEP sync for tenant $CustomerTenantID"
    $endpoint = '/api/ExecSyncDEP'
    $body = @{
        tenantFilter = $CustomerTenantID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method 'POST'
}
