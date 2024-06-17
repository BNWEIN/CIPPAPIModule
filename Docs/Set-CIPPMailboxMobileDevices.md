# Set-CIPPMailboxMobileDevices
## SYNOPSIS
Edits the mobile device settings for a specified user in a customer's tenant.
## DESCRIPTION
The Set-CIPPMailboxMobileDevices function allows you to edit the mobile device settings for a specified user in a customer's tenant. 
You can set the device ID, user ID, quarantine status, delete status, and device GUID.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer's tenant.

  ## **-DeviceID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the ID of the mobile device.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the user.

  ## **-Quarantine**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies whether the mobile device should be quarantined. Valid values are "true" or "False".

  ## **-Delete**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether the mobile device should be deleted. Valid values are "true" or "False". The default value is "False".

  ## **-DeviceGUID**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the GUID of the mobile device.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPMailboxMobileDevices -CustomerTenantID "contoso.onmicrosoft.com" -DeviceID "ABCD1234" -UserID "user1@domain.com" -Quarantine "true"

This example sets the mobile device with the ID "ABCD1234" for the user "user1@domain.com" in the customer's tenant with the ID "contoso.onmicrosoft.com" to be quarantined.
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPMailboxMobileDevices -CustomerTenantID "contoso.onmicrosoft.com" -UserID "user1@domain.com" -Delete "true" -DeviceGUID "EFGH5678"

This example deletes the mobile device with the GUID "EFGH5678" for the user "user1@domain.com" in the customer's tenant with the ID "contoso.onmicrosoft.com".
```

