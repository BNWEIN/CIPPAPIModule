<#
.SYNOPSIS
Retrieves sign-in information for a specific customer tenant.

.DESCRIPTION
The Get-CIPPSignIns function retrieves sign-in information for a specific customer tenant. It can filter the results based on various criteria such as failed logons.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant for which to retrieve sign-in information. This parameter is mandatory.

.PARAMETER failedlogononly
Indicates whether to retrieve only failed logon sign-ins. This parameter is optional.

.PARAMETER filter
Specifies an additional filter to apply to the sign-in results. This parameter is optional.

.EXAMPLE
Get-CIPPSignIns -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -failedlogononly

This example retrieves all failed logon sign-ins for the customer tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>

function Get-CIPPSignIns {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [switch]$failedlogononly,
        [Parameter(Mandatory = $false)]
        [string]$filter
    )

    Write-Verbose "Getting Signins for $CustomerTenantID"
    $endpoint = "/api/listsignins"
    $params = @{
        tenantfilter = $CustomerTenantID
        filter = $filter
    }

    if ($failedlogononly) {
        $params.failedlogononly = "true"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
