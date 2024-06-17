<#
.SYNOPSIS
Retrieves public phishing check for a specific customer tenant.

.DESCRIPTION
The Get-CIPPPublicPhishingCheck function retrieves the public phishing check for a specific customer tenant. It makes an API call to the "/api/publicphishingcheck" endpoint with the provided tenant ID.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to retrieve the public phishing check.

.EXAMPLE
Get-CIPPPublicPhishingCheck -CustomerTenantID "12345"
Retrieves the public phishing check for the customer tenant with the ID "12345".

#>
function Get-CIPPPublicPhishingCheck {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )
    
    Write-Verbose "Getting public phishing check $CustomerTenantID"
    $endpoint = "/api/publicphishingcheck"
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
