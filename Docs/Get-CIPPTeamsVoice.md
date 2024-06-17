# Get-CIPPTeamsVoice
## SYNOPSIS
Retrieves teams voice information for a specified customer tenant ID.
## DESCRIPTION
The Get-CIPPTeamsVoice function retrieves teams voice information for a specified customer tenant ID. It makes use of the Invoke-CIPPRestMethod function to send a request to the "/api/listteamsvoice" endpoint with the provided tenant filter.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The customer tenant ID for which to retrieve teams voice information. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPTeamsVoice -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

