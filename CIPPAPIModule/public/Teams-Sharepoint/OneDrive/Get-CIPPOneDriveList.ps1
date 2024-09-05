<#
.SYNOPSIS
Retrieves a list of OneDrive sites for a specified customer tenant.

.DESCRIPTION
The Get-CIPPOneDriveList function retrieves a list of OneDrive sites for a specified customer tenant. It uses the Invoke-CIPPRestMethod function to make a REST API call to retrieve the sites.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which to retrieve the OneDrive sites.

.PARAMETER urlonly
Specifies whether to return only the URLs of the OneDrive sites. If this switch is used, only the URLs will be returned.

.PARAMETER UserUPN
The user's UPN (User Principal Name) for which to retrieve the OneDrive sites. This parameter is optional.

.EXAMPLE
PS> Get-CIPPOneDriveList -CustomerTenantID "example.com"

Retrieves a list of OneDrive sites for the customer tenant with the ID "example.com".

.EXAMPLE
PS> Get-CIPPOneDriveList -CustomerTenantID "example.com" -urlonly

Retrieves a list of OneDrive site URLs for the customer tenant with the ID "example.com".

.EXAMPLE
PS> Get-CIPPOneDriveList -CustomerTenantID "example.com" -UserUPN "user@example.com"

Retrieves a list of OneDrive sites for the customer tenant with the ID "example.com" and the specified user's UPN "user@example.com".

#>
function Get-CIPPOneDriveList {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [switch]$urlonly,
        [Parameter(Mandatory = $false)]
        [string]$UserUPN
    )

    Write-Verbose "Getting sites for $CustomerTenantID"
    $endpoint = "/api/listsites"
    $params = @{
        tenantfilter = $CustomerTenantID
        type = "OneDriveUsageAccount"
        userupn = $UserUPN
    }

    if ($urlonly) {
        $params.URLOnly = "true"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
