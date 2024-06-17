# Get-CIPPUserCAPolicies
## SYNOPSIS
Retrieves the Conditional Access (CA) policies for a specific user in a customer's tenant.
## DESCRIPTION
The Get-CIPPUserCAPolicies function retrieves the Conditional Access (CA) policies for a specific user in a customer's tenant. It makes use of the Invoke-CIPPRestMethod function to send a request to the API endpoint "/api/listuserconditionalaccesspolicies" and returns the response.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer's tenant.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user for whom the CA policies are to be retrieved.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPUserCAPolicies -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "user1@dom.com"
```

