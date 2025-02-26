# Get-CIPPRooms
## SYNOPSIS
Retrieves rooms for a specific customer tenant.
## DESCRIPTION
The Get-CIPPRooms function retrieves rooms for a specific customer tenant by making a REST API call to the "/api/listrooms" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant.

  ## **-RoomID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \


 #### EXAMPLE 1
```powershell
PS > Get-CIPPRooms -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

