# Get-CIPPTeamsActivity
## SYNOPSIS
Retrieves the activity of Teams users in a specified customer tenant.
## DESCRIPTION
The Get-CIPPTeamsActivity function retrieves the activity of Teams users in a specified customer tenant. It makes use of the Invoke-CIPPRestMethod function to send a request to the "/api/listteamsactivity" endpoint with the provided parameters.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which to retrieve the Teams activity.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPTeamsActivity -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

