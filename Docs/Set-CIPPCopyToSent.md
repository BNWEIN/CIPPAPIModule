# Set-CIPPCopyToSent
## SYNOPSIS
Sets the option to copy sent items to a shared mailbox for a specific user.
## DESCRIPTION
The Set-CIPPCopyToSent function sets the option to copy sent items to a shared mailbox for a specific mailbox in the CIPP system.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer's tenant.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the mailbox to set the copy sent items option for.

  ## **-MessageCopyState**
> ![Foo](https://img.shields.io/badge/Type-Boolean-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-True-Blue?color=5547a8)\
Specifies whether to enable or disable the option to copy sent items for the mailbox.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPCopyToSent -CustomerTenantID "contoso.onmicrosoft.com" -UserID "john.doe@domain.com" -MessageCopyState $true

This example sets the option to copy sent items to a shared mailbox for the user "john.doe@domain.com" in the customer's tenant with ID "contoso.onmicrosoft.com".
```

