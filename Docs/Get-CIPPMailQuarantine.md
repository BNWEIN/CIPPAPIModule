# Get-CIPPMailQuarantine
## SYNOPSIS
Retrieves the mail quarantine for a specific customer tenant.
## DESCRIPTION
The Get-CIPPMailQuarantine function retrieves the mail quarantine for a specific customer tenant by making a REST API call to the "/api/listmailquarantine" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which to retrieve the mail quarantine.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPMailQuarantine -CustomerTenantID "contoso.onmicrosoft.com"
```

