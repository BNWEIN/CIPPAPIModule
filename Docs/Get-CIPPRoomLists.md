# Get-CIPPRoomLists
## SYNOPSIS
Retrieves room lists for a specific customer tenant.
## DESCRIPTION
The Get-CIPPRoomLists function retrieves room lists for a specific customer tenant by making a REST API call to the "/api/listroomlists" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPRoomLists -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

