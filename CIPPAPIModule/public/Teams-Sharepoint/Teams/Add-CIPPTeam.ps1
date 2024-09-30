<#
.SYNOPSIS
    Adds a new team site to the specified customer tenant.

.DESCRIPTION
    The Add-CIPPTeam function creates a new team site in the specified customer tenant using the provided display name, description, visibility, and owner.

.PARAMETER CustomerTenantID
    The ID of the customer tenant where the team site will be added. Can be the tenant ID or default domain name.

.PARAMETER DisplayName
    The display name of the new team site.

.PARAMETER Description
    A description for the new team site.

.PARAMETER Visibility
    The visibility setting for the new team site (e.g., Public or Private).

.PARAMETER Owner
    The owner of the new team site. Should be a valid user principal name (UPN) with a teams license assigned.

.EXAMPLE
    Add-CIPPTeam -CustomerTenantID "9d606831-a394-4d1a-b508-260f428807a4" -DisplayName "Engineering Team" -Description "Team for engineering department" -Visibility "Private" -Owner "john.doe@example.com"
    This example adds a new team site named "Engineering Team" with the description "Team for engineering department" to the customer tenant with the ID "12345". The team site is set to private visibility and owned by john.doe@example.com.

.EXAMPLE
    Add-CIPPTeam -CustomerTenantID "exampleTenant.onmicrosoft.com" -DisplayName "Marketing Team" -Description "Team for marketing department" -Visibility "Public" -Owner "Jane.doe@example.com"
    This example adds a new team site named "Marketing Team" with the description "Team for marketing department" to the customer tenant with the ID "67890". The team site is set to public visibility and owned by Jane.doe@example.com


.NOTES
    This function requires the Invoke-CIPPRestMethod cmdlet to send the request to the API endpoint.
#>
function Add-CIPPTeam {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$DisplayName,
        [Parameter(Mandatory = $false)]
        [string]$Description,
        [Parameter(Mandatory = $true)]
        [ValidateSet('private', 'public')]
        [string]$Visibility,
        [Parameter(Mandatory = $true)]
        [string]$Owner
    )

    Write-Verbose "Adding team site $DisplayName for $CustomerTenantID"
    $endpoint = '/api/AddTeam'
    $Body = @{
        tenantID    = $CustomerTenantID
        displayName = $DisplayName
        description = $Description
        visibility  = $Visibility
        owner       = $Owner
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $Body -Method 'POST'
}
