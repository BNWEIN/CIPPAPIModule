<#
.SYNOPSIS
Creates a OneDrive shortcut for a user to a specified SharePoint URL.

.DESCRIPTION
The Set-CIPPOneDriveShortCut function creates a OneDrive shortcut for a specified user to a specified SharePoint URL. It uses the Invoke-CIPPRestMethod function to make a POST request to the "/api/execonedriveshortcut" endpoint.

.PARAMETER CustomerTenantID
The default domain of the customer's tenant.

.PARAMETER Username
The username of the user for whom the OneDrive shortcut is being created.

.PARAMETER UserID
The UserID of the user for whom the OneDrive shortcut is being created.

.PARAMETER SharePointURL
The URL of the SharePoint site to which the OneDrive shortcut will point.

.EXAMPLE
Set-CIPPOneDriveShortCut -CustomerTenantID "contoso.onmicrosoft.com" -Username "john.doe@contoso.onmicrosoft.com" -UserID "98765432-1234-5678-9012-34567890abcd" -SharePointURL "https://contoso.sharepoint.com/sites/finance"

This example creates a OneDrive shortcut for the user "john.doe@contoso.onmicrosoft.com" to the SharePoint site located at "https://contoso.sharepoint.com/sites/finance" in the customer's tenant with the ID "contoso.onmicrosoft.com".

#>

function Set-CIPPOneDriveShortCut {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$Username,
        [Parameter(Mandatory = $false)]
        [guid]$UserID,
        [Parameter(Mandatory = $true)]
        [string]$SharePointURL
    )

    Write-Verbose "Creating OneDrive Shortcut for $Username to $SharePointURL"
    $endpoint = '/api/ExecOneDriveShortCut'
    $body = @{
        tenantFilter = $CustomerTenantID
        username     = $Username
        userid       = $UserID
        siteUrl      = @{ value = $SharePointURL }
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
