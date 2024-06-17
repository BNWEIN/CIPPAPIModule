# Get-CIPPIntunePolicy
## SYNOPSIS
Retrieves Intune policies for a specific customer.
## DESCRIPTION
The Get-CIPPIntunePolicy function retrieves Intune policies for a specific customer based on the provided parameters. It uses the Invoke-CIPPRestMethod function to make the request to the API.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer's tenant.

  ## **-PolicyID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The ID of the policy. This parameter is optional.

  ## **-Urlname**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The URL name. This parameter is optional.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPIntunePolicy -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -PolicyID "policy123" -Urlname "example"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPIntunePolicy -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

