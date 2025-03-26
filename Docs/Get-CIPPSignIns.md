# Get-CIPPSignIns
## SYNOPSIS
Retrieves sign-in information for a specific customer tenant.
## DESCRIPTION
The Get-CIPPSignIns function retrieves sign-in information for a specific customer tenant. It can filter the results based on various criteria such as failed logons.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant for which to retrieve sign-in information. This parameter is mandatory.

  ## **-FailedLogonOnly**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Indicates whether to retrieve only failed logon sign-ins. This parameter is optional.

  ## **-Filter**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies an additional filter to apply to the sign-in results. This parameter is optional.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPSignIns -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -failedlogononly

This example retrieves all failed logon sign-ins for the customer tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".
```

