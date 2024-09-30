<#
.SYNOPSIS
Adds a new SharePoint site to the specified customer tenant.

.DESCRIPTION
The Add-CIPPSharePointSite function creates a new SharePoint site with the specified parameters. 
It supports different site designs and templates.

.PARAMETER CustomerTenantID
The ID of the customer tenant where the SharePoint site will be added. This parameter is mandatory.

.PARAMETER DisplayName
The display name of the SharePoint site. This parameter is mandatory.

.PARAMETER Description
The description of the SharePoint site. This parameter is mandatory.

.PARAMETER Owner
The owner of the SharePoint site. Should be a valid user principal name (UPN). This parameter is mandatory.

.PARAMETER SiteDesign
The design of the SharePoint site. Valid values are 'Topic', 'Showcase', 'Blank', and 'Custom'. 
The default value is 'Showcase'. This parameter is optional.

.PARAMETER TemplateName
The template of the SharePoint site. Valid values are 'Communication' and 'Team'. 
The default value is 'Communication'. This parameter is optional.

.EXAMPLE
Add-CIPPSharePointSite -CustomerTenantID "166cc908-10b2-405f-a00b-03006c430c9c" -DisplayName "Project Site" -Description "Site for project collaboration" -Owner "owner@domain.com"
This example adds a new SharePoint site with the display name "Project Site" and the description "Site for project collaboration" to the customer tenant with ID "166cc908-10b2-405f-a00b-03006c430c9c". The owner of the site is "owner@domain.com".

.EXAMPLE
Add-CIPPSharePointSite -CustomerTenantID "domain.com" -DisplayName "Project Site" -Description "Site for project collaboration" -Owner "owner@domain.com"
This example adds a new SharePoint site with the display name "Project Site" and the description "Site for project collaboration" to the customer tenant with ID "domain.com". The owner of the site is "owner@domain.com".

.NOTES
This function requires the Invoke-CIPPRestMethod cmdlet to send the request to the API endpoint.
#>
function Add-CIPPSharePointSite {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$DisplayName,
        [Parameter(Mandatory = $true)]
        [string]$Description,
        [Parameter(Mandatory = $true)]
        [string]$Owner,
        [Parameter(Mandatory = $false)]
        [ValidateSet('Topic', 'Showcase', 'Blank', 'Custom')]
        [string]$SiteDesign = 'Showcase',
        [Parameter(Mandatory = $false)]
        [ValidateSet('Communication', 'Team')]
        [string]$TemplateName = 'Communication'
    )

    Write-Verbose "Adding SharePoint site $DisplayName for $CustomerTenantID"
    $endpoint = '/api/AddSite'
    $Body = @{
        tenantFilter    = $CustomerTenantID
        siteName        = $DisplayName
        siteDescription = $Description
        siteOwner       = @{ value = $Owner }
        siteDesign      = @{ value = $SiteDesign }
        TemplateName    = @{ value = $TemplateName }
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $Body -Method 'POST'
}
