# Set-CIPPContact
## SYNOPSIS
Modifies a contact in the CIPP API.
## DESCRIPTION
The Set-CIPPContact function is used to edit a contact in the CIPP API. It allows you to modify various properties of the contact, such as display name, email address, first name, last name, job title, address, phone numbers, etc.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant where the contact belongs.

  ## **-ContactID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the contact to be edited.

  ## **-DisplayName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The new display name for the contact. If not provided, the existing display name will be used.

  ## **-ExternalEmailAddress**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The new external email address for the contact. If not provided, the existing email address will be used.

  ## **-FirstName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The new first name for the contact. If not provided, the existing first name will be used.

  ## **-LastName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The new last name for the contact. If not provided, the existing last name will be used.

  ## **-JobTitle**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The new job title for the contact. If not provided, the existing job title will be used.

  ## **-StreetAddress**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The new street address for the contact. If not provided, the existing street address will be used.

  ## **-PostalCode**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The new postal code for the contact. If not provided, the existing postal code will be used.

  ## **-City**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The new city for the contact. If not provided, the existing city will be used.

  ## **-Country**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The new country for the contact. If not provided, the existing country will be used. This must be a valid ISO 3166-1 alpha-2 country code.

  ## **-MobilePhone**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The new mobile phone number for the contact. If not provided, the existing mobile phone number will be used.

  ## **-PhoneNumber**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The new business phone number for the contact. If not provided, the existing business phone number will be used.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPContact -CustomerTenantID "contoso.onmicrosoft.com" -ContactID "46200db7-45cd-447e-a7d9-1d2feb91bb10" -DisplayName "John Doe" -JobTitle "Manager"

This example edits the contact with ID "46200db7-45cd-447e-a7d9-1d2feb91bb10" in the customer tenant "contoso.onmicrosoft.com". It sets the display name to "John Doe" and the job title to "Manager". Other properties remain unchanged.
```

