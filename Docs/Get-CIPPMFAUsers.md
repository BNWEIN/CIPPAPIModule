# Get-CIPPMFAUsers
## SYNOPSIS
Retrieves the MFA users for a specified customer tenant ID.
## DESCRIPTION
The Get-CIPPMFAUsers function retrieves the MFA users for a specified customer tenant ID by making a REST API call to the "/api/listmfausers" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the customer tenant ID for which to retrieve the MFA users.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPMFAUsers -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

