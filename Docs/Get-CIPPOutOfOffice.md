# Get-CIPPOutOfOffice
## SYNOPSIS
Retrieves the out of office status for a specified user.
## DESCRIPTION
The Get-CIPPOutOfOffice function retrieves the out of office status for a specified user in a customer's tenant.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer's tenant.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the user.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPOutOfOffice -CustomerTenantID "contoso.onmicrosoft.com" -UserID "john.doe@domain.com"
```

