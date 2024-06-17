# Get-CIPPPublicPhishingCheck
## SYNOPSIS
Retrieves public phishing check for a specific customer tenant.
## DESCRIPTION
The Get-CIPPPublicPhishingCheck function retrieves the public phishing check for a specific customer tenant. It makes an API call to the "/api/publicphishingcheck" endpoint with the provided tenant ID.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which to retrieve the public phishing check.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPPublicPhishingCheck -CustomerTenantID "87654321-4321-4321-4321-0987654321BA"
```

