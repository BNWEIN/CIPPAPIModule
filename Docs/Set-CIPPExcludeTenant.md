# Set-CIPPExcludeTenant
## SYNOPSIS
Sets the exclusion status for a customer tenant in the CIPP system.
## DESCRIPTION
The Set-CIPPExcludeTenant function is used to add or remove a customer tenant from the exclusion list in the CIPP system. 
Exclusion means that the tenant will be excluded from certain operations or processes in the system.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant. If you are adding a tenant, this needs to be their default domain (contoso.onmicrosoft.com), if you are excluding a tenant this needs to be the tenant ID Guid (1fefeb73-0947-4803-a720-92be0e9a7d8e)

  ## **-AddExclusion**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Indicates whether to add the customer tenant to the exclusion list. This switch cannot be used together with the RemoveExclusion switch.

  ## **-RemoveExclusion**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Indicates whether to remove the customer tenant from the exclusion list. This switch cannot be used together with the AddExclusion switch.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPExcludeTenant -CustomerTenantID "1fefeb73-0947-4803-a720-92be0e9a7d8e" -AddExclusion
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPExcludeTenant -CustomerTenantID "contoso.onmicrosoft.com" -RemoveExclusion
```

