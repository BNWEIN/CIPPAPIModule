# Get-CIPPUsers
## SYNOPSIS
Retrieves user information from the CIPP API.
## DESCRIPTION
The Get-CIPPUsers function is used to retrieve user information from the CIPP API. It can retrieve all users for a specific tenant or retrieve details for a specific user.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant for which to retrieve user information. This parameter is mandatory.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the ID of the user for which to retrieve details. This parameter is optional.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPUsers -CustomerTenantID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPUsers -CustomerTenantID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc" -UserID "user@domain.com"
```

