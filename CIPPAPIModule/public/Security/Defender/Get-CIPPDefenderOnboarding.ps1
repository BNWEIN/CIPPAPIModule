<#
.SYNOPSIS
    Retrieves Microsoft Defender for Endpoint onboarding status.

.DESCRIPTION
    The Get-CIPPDefenderOnboarding function retrieves Microsoft Defender for Endpoint onboarding status for a customer tenant. It can query live data or cached report database data when UseReportDB is specified.

.PARAMETER CustomerTenantID
    Specifies the customer tenant ID or default domain name to retrieve onboarding status for. Use 'AllTenants' with UseReportDB to retrieve cached onboarding status for all tenants.

.PARAMETER UseReportDB
    When specified, retrieves onboarding status from the CIPP report database instead of live Microsoft Graph data.

.EXAMPLE
    Get-CIPPDefenderOnboarding -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
    Retrieves live Defender onboarding status for the specified customer tenant.

.EXAMPLE
    Get-CIPPDefenderOnboarding -CustomerTenantID "AllTenants" -UseReportDB
    Retrieves cached Defender onboarding status for all tenants from the report database.

.EXAMPLE
    Get-CIPPMDEOnboarding -CustomerTenantID "contoso.onmicrosoft.com"
    Retrieves live Defender onboarding status using the MDE alias.
#>
function Get-CIPPDefenderOnboarding {
    [CmdletBinding()]
    [Alias('Get-CIPPMDEOnboarding')]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $false)]
        [switch]$UseReportDB
    )

    Write-Verbose "Getting Defender onboarding status for customer: $CustomerTenantID"

    $endpoint = '/api/ListMDEOnboarding'
    $params = @{
        tenantFilter = $CustomerTenantID
        UseReportDB  = $UseReportDB.IsPresent
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method GET
}
