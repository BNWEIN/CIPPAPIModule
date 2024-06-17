# Get-CIPPSpamFilter
## SYNOPSIS
Retrieves the spam filter settings for a specified customer tenant ID.
## DESCRIPTION
The Get-CIPPSpamFilter function retrieves the spam filter settings for a specified customer tenant ID using the CIPP API. It sends a request to the "/api/listspamfilter" endpoint with the provided tenant ID as a filter parameter.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The customer tenant ID for which to retrieve the spam filter settings. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPSpamFilter -CustomerTenantID "contoso.onmicrosoft.com"
```

