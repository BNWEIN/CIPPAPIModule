<#
.SYNOPSIS
Adds a new guest user to a tenant.

.DESCRIPTION
The Add-CIPPGuest function creates a new guest user in the specified tenant with the provided settings.
This allows external users to collaborate with internal users.

.PARAMETER CustomerTenantID
The tenant ID or default domain for the customer tenant.

.PARAMETER DisplayName
The display name of the guest user.

.PARAMETER EmailAddress
The email address of the guest user.

.PARAMETER Message
Optional message to include in the guest invitation.

.PARAMETER RedirectURL
URL to redirect the guest user to after accepting the invitation.

.EXAMPLE
Add-CIPPGuest -CustomerTenantID "contoso.onmicrosoft.com" -DisplayName "John Partner" -EmailAddress "john@partner.com" -Message "Welcome to our collaboration project" -RedirectURL "https://teams.microsoft.com"

This example adds a new guest user to the Contoso tenant with specified invitation details.
#>

function Add-CIPPGuest {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        
        [Parameter(Mandatory = $true)]
        [string]$DisplayName,
        
        [Parameter(Mandatory = $true)]
        [string]$EmailAddress,
        
        [Parameter(Mandatory = $false)]
        [string]$Message,
        
        [Parameter(Mandatory = $false)]
        [string]$RedirectURL
    )

    $endpoint = '/api/AddGuest'
    
    $body = @{
        tenantFilter = $CustomerTenantID
        displayName  = $DisplayName
        emailAddress = $EmailAddress
        message      = $Message
        redirectURL  = $RedirectURL
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Method Post -Body $body
}
