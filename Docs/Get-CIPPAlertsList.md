# Get-CIPPAlertsList
## SYNOPSIS
Retrieves a list of alerts for a specific customer.
## DESCRIPTION
The Get-CIPPAlertsList function retrieves a list of alerts for a specific customer identified by their tenant ID.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The tenant ID of the customer for whom to retrieve the alerts.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPAlertsList -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

