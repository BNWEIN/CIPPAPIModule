<#
.SYNOPSIS
    Modifies a contact in the CIPP API.

.DESCRIPTION
    The Set-CIPPContact function is used to edit a contact in the CIPP API. It allows you to modify various properties of the contact, such as display name, email address, first name, last name, job title, address, phone numbers, etc.

.PARAMETER CustomerTenantID
    The ID of the customer tenant where the contact belongs.

.PARAMETER ContactID
    The ID of the contact to be edited.

.PARAMETER DisplayName
    The new display name for the contact. If not provided, the existing display name will be used.

.PARAMETER ExternalEmailAddress
    The new external email address for the contact. If not provided, the existing email address will be used.

.PARAMETER FirstName
    The new first name for the contact. If not provided, the existing first name will be used.

.PARAMETER LastName
    The new last name for the contact. If not provided, the existing last name will be used.

.PARAMETER JobTitle
    The new job title for the contact. If not provided, the existing job title will be used.

.PARAMETER StreetAddress
    The new street address for the contact. If not provided, the existing street address will be used.

.PARAMETER PostalCode
    The new postal code for the contact. If not provided, the existing postal code will be used.

.PARAMETER City
    The new city for the contact. If not provided, the existing city will be used.

.PARAMETER Country
    The new country for the contact. If not provided, the existing country will be used. This must be a valid ISO 3166-1 alpha-2 country code.

.PARAMETER MobilePhone
    The new mobile phone number for the contact. If not provided, the existing mobile phone number will be used.

.PARAMETER PhoneNumber
    The new business phone number for the contact. If not provided, the existing business phone number will be used.

.EXAMPLE
    Set-CIPPContact -CustomerTenantID "contoso.onmicrosoft.com" -ContactID "46200db7-45cd-447e-a7d9-1d2feb91bb10" -DisplayName "John Doe" -JobTitle "Manager"

    This example edits the contact with ID "46200db7-45cd-447e-a7d9-1d2feb91bb10" in the customer tenant "contoso.onmicrosoft.com". It sets the display name to "John Doe" and the job title to "Manager". Other properties remain unchanged.

#>

function Set-CIPPContact {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$ContactID,
        [Parameter(Mandatory = $false)]
        [string]$DisplayName,
        [Parameter(Mandatory = $false)]
        [string]$ExternalEmailAddress,
        [Parameter(Mandatory = $false)]
        [string]$FirstName,
        [Parameter(Mandatory = $false)]
        [string]$LastName,
        [Parameter(Mandatory = $false)]
        [string]$JobTitle,
        [Parameter(Mandatory = $false)]
        [string]$StreetAddress,
        [Parameter(Mandatory = $false)]
        [string]$PostalCode,
        [Parameter(Mandatory = $false)]
        [string]$City,
        [Parameter(Mandatory = $false)]
        [string]$Country,
        [Parameter(Mandatory = $false)]
        [string]$MobilePhone,
        [Parameter(Mandatory = $false)]
        [string]$PhoneNumber
    )

    Write-Verbose "Editing Contact in tenant: $CustomerTenantID"

    $existingContact = Get-CIPPContacts -CustomerTenantID $CustomerTenantID -ContactID $ContactID

    # Filter to get the mobile and business phone numbers from the phones collection
    $existingMobilePhone = ($existingContact.phones | Where-Object { $_.type -eq 'mobile' }).number
    $existingBusinessPhone = ($existingContact.phones | Where-Object { $_.type -eq 'business' }).number

    $Endpoint = '/api/Editcontact'

    $body = @{
        tenantID      = $CustomerTenantID
        ContactID     = $ContactID
        DisplayName   = $DisplayName ? $DisplayName : $existingContact.DisplayName
        mail          = $ExternalEmailAddress ? $ExternalEmailAddress : $existingContact.mail
        firstName     = $FirstName ? $FirstName : $existingContact.givenName
        LastName      = $LastName ? $LastName : $existingContact.surname
        jobTitle      = $JobTitle ? $JobTitle : $existingContact.jobTitle
        Country       = $Country ? $Country : $existingContact.addresses.CountryOrRegion
        PostalCode    = $PostalCode ? $PostalCode : $existingContact.addresses.postalcode
        CompanyName   = $CompanyName ? $CompanyName : $existingContact.companyName
        StreetAddress = $StreetAddress ? $StreetAddress : $existingContact.addresses.street
        MobilePhone   = $MobilePhone ? $MobilePhone : $existingMobilePhone
        BusinessPhone = $PhoneNumber ? $PhoneNumber : $existingBusinessPhone
        City          = $City ? $City : $existingContact.addresses.city
    }

    Invoke-CIPPRestMethod -Endpoint $Endpoint -Body $body -Method POST
}
