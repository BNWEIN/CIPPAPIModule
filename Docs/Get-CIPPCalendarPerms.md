# Get-CIPPCalendarPerms
## SYNOPSIS
Retrieves calendar permissions for a user in a specified customer tenant.
## DESCRIPTION
The Get-CIPPCalendarPerms function retrieves the calendar permissions for a user in a specified customer tenant using the CIPP API. It sends a request to the "/api/listcalendarpermissions" endpoint with the provided customer tenant ID and user ID.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPCalendarPerms -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "john.doe@example.com"
```

