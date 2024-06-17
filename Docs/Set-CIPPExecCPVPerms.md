# Set-CIPPExecCPVPerms
## SYNOPSIS
Sets the CPV (Customer Provided Values) permissions for a specific customer tenant.
## DESCRIPTION
The Set-CIPPExecCPVPerms function is used to refresh the CPV permissions for a specified customer tenant. It calls the Invoke-CIPPRestMethod function internally to make the REST API call.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant for which the CPV permissions need to be refreshed. This parameter is mandatory.

  ## **-resetsp**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-false-Blue?color=5547a8)\
Specifies whether to reset the Stored Procedure (SP) associated with the CPV permissions. The valid values are "true" and "false". This parameter is optional and defaults to "false".

 #### EXAMPLE 1
```powershell
PS > Set-CIPPExecCPVPerms -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -resetsp "true"
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPExecCPVPerms -CustomerTenantID "87654321-4321-4321-4321-0987654321BA"
```

