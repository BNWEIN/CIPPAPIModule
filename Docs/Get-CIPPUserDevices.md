# Get-CIPPUserDevices
## SYNOPSIS
Retrieves the devices associated with a specific user.
## DESCRIPTION
The Get-CIPPUserDevices function retrieves the devices associated with a specific user in the CIPP system. It makes a REST API call to the "/api/listuserdevices" endpoint, passing the customer tenant ID and user ID as parameters.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPUserDevices -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "user1@domain.com"
```

