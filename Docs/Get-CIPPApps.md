# Get-CIPPApps
## SYNOPSIS
Retrieves a list of apps for a specific customer tenant ID.
## DESCRIPTION
The Get-CIPPApps function retrieves a list of apps for a specific customer tenant ID by making a REST API call to the "/api/listapps" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the customer tenant ID for which to retrieve the apps.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPApps -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

