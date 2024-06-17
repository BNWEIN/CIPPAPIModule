# Get-CIPPInactiveAccounts
## SYNOPSIS
Retrieves a list of inactive accounts for a specific customer.
## DESCRIPTION
The Get-CIPPInactiveAccounts function retrieves a list of inactive accounts for a specific customer based on the provided CustomerTenantID.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer's tenant for which to retrieve the inactive accounts.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPInactiveAccounts -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

