<#
.SYNOPSIS
Adds a contact to a customer's tenant.

.DESCRIPTION
The Add-CIPPContact function adds a contact to a customer's tenant using the CIPP API. It requires the customer's tenant ID, display name, external email address, first name, and last name as mandatory parameters.

.PARAMETER CustomerTenantID
The ID of the customer's tenant.

.PARAMETER DisplayName
The display name of the contact.

.PARAMETER ExternalEmailAddress
The external email address of the contact.

.PARAMETER FirstName
The first name of the contact.

.PARAMETER LastName
The last name of the contact.

.EXAMPLE
Add-CIPPContact -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -DisplayName "John Doe" -ExternalEmailAddress "john.doe@example.com" -FirstName "John" -LastName "Doe"
Adds a contact with the specified details to the customer's tenant.

#>
function Add-CIPPContact {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$DisplayName,
            [Parameter(Mandatory = $true)]
            [string]$ExternalEmailAddress,
            [Parameter(Mandatory = $true)]
            [string]$FirstName,
            [Parameter(Mandatory = $true)]
            [string]$LastName

        )

    Write-Verbose "Adding Contact in tenant: $CustomerTenantID"
    $Endpoint = "/api/addcontact"
    $body = @{
        tenantid        = $CustomerTenantID
        displayName     = $DisplayName
        email           = $ExternalEmailAddress
        FirstName       = $FirstName
        LastName        = $LastName
    }
    Invoke-CIPPRestMethod -Endpoint $Endpoint -Body $body -Method POST
}
