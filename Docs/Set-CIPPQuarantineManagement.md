# Set-CIPPQuarantineManagement
## SYNOPSIS
Manages quarantine for a specific customer tenant ID.
## DESCRIPTION
The Set-CIPPQuarantineManagement function is used to manage quarantine for a specific customer tenant ID. It allows you to set various parameters such as the ID, AllowSender, and Type.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the customer tenant ID for which the quarantine management is performed. This parameter is mandatory.

  ## **-Identity**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \


  ## **-AllowSender**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies whether to allow the sender. Valid values are 'true' or 'false'. This parameter is optional.

  ## **-Type**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the type of quarantine management. Valid values are 'Deny' or 'Release'. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPQuarantineManagement -CustomerTenantID "contoso.onmicrosoft.com" -ID "67890" -AllowSender "true" -Type "Deny"

This example sets the quarantine management for the customer tenant ID "contoso.onmicrosoft.com" with the ID "67890". It allows the sender and sets the type to "Deny".
```

