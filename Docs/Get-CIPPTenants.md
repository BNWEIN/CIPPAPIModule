# Get-CIPPTenants
## SYNOPSIS
Retrieves a list of CIPP tenants.
## DESCRIPTION
The Get-CIPPTenants function retrieves a list of CIPP tenants based on the specified parameters. It makes a REST API call to the "/api/listtenants" endpoint and returns the result.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the ID of the customer tenant. This parameter is optional.

  ## **-ClearCache**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Indicates whether to clear the cache before retrieving the tenants. This parameter is optional.

  ## **-TriggerRefresh**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Indicates whether to trigger a refresh before retrieving the tenants. This parameter is optional.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPTenants -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -ClearCache
```

