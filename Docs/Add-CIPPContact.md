# Add-CIPPContact
## SYNOPSIS
Adds a contact to a customer's tenant.
## DESCRIPTION
The Add-CIPPContact function adds a contact to a customer's tenant using the CIPP API. It requires the customer's tenant ID, display name, external email address, first name, and last name as mandatory parameters.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer's tenant.

  ## **-DisplayName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The display name of the contact.

  ## **-ExternalEmailAddress**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The external email address of the contact.

  ## **-FirstName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The first name of the contact.

  ## **-LastName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The last name of the contact.

 #### EXAMPLE 1
```powershell
PS > Add-CIPPContact -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -DisplayName "John Doe" -ExternalEmailAddress "john.doe@example.com" -FirstName "John" -LastName "Doe"
```

