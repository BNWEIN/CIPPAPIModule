# Add-CIPPGuest
## SYNOPSIS
Adds a new guest user to a tenant.
## DESCRIPTION
The Add-CIPPGuest function creates a new guest user in the specified tenant with the provided settings.
This allows external users to collaborate with internal users.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The tenant ID or default domain for the customer tenant.

  ## **-DisplayName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The display name of the guest user.

  ## **-EmailAddress**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The email address of the guest user.

  ## **-Message**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Optional message to include in the guest invitation.

  ## **-RedirectURL**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
URL to redirect the guest user to after accepting the invitation.

  ## **-SendInvite**
> ![Foo](https://img.shields.io/badge/Type-Boolean-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-True-Blue?color=5547a8)\
When set to $true (default), sends the invitation email to the guest user.

 #### EXAMPLE 1
```powershell
PS > Add-CIPPGuest -CustomerTenantID "contoso.onmicrosoft.com" -DisplayName "John Partner" -EmailAddress "john@partner.com" -Message "Welcome to our collaboration project" -RedirectURL "https://teams.microsoft.com"

This example adds a new guest user to the Contoso tenant with specified invitation details.
```

