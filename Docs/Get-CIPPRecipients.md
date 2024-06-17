# Get-CIPPRecipients
## SYNOPSIS
Retrieves recipients for a specified customer tenant ID.
## DESCRIPTION
The Get-CIPPRecipients function retrieves recipients for a specified customer tenant ID by making a REST API call to the "/api/listrecipients" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the customer tenant ID for which to retrieve recipients.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPRecipients -CustomerTenantID "contoso.onmicrosoft.com"
```

