# Get-CIPPGroups
## SYNOPSIS
Retrieves information about CIPP groups.
## DESCRIPTION
The Get-CIPPGroups function retrieves information about CIPP groups based on the provided parameters. It can retrieve all groups for a specific tenant, group details for a specific group, group members for a specific group, or group owners for a specific group.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant for which to retrieve the groups.

  ## **-GroupID**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the ID of the group for which to retrieve the information. If not provided, all groups for the specified tenant will be retrieved.

  ## **-Members**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Switch parameter. If specified, retrieves the members of the specified group.

  ## **-Owners**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Switch parameter. If specified, retrieves the owners of the specified group.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPGroups -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPGroups -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -GroupID "abcdefg"
```
 #### EXAMPLE 3
```powershell
PS > Get-CIPPGroups -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -GroupID "abcdefg" -Members
```
 #### EXAMPLE 4
```powershell
PS > Get-CIPPGroups -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -GroupID "abcdefg" -Owners
```

