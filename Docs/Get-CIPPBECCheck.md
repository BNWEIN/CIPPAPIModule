# Get-CIPPBECCheck
## SYNOPSIS
Performs a BEC (Business Email Compromise) check for a user.
## DESCRIPTION
The Get-CIPPBECCheck function performs a BEC check for a user by making a REST API call to the specified endpoint.
It waits for the check to complete and returns the response.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer's tenant.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user.

  ## **-UserName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The name of the user.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPBECCheck -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc" -UserName "JohnDoe"
```

