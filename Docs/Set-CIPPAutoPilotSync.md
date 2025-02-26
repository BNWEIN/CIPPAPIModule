# Set-CIPPAutoPilotSync
## SYNOPSIS
Syncs AutoPilot devices for a specified customer tenant ID.
## DESCRIPTION
The Set-CIPPAutoPilotSync function is used to sync AutoPilot devices for a specific customer tenant ID. It makes a request to the specified endpoint with the provided parameters.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the customer tenant ID for which the AutoPilot devices need to be synced.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPAutoPilotSync -CustomerTenantID "contoso.onmicrosoft.com"
```

