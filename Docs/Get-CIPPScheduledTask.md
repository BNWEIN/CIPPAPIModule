# Get-CIPPScheduledTask
## SYNOPSIS
Gets scheduled tasks from CIPP.
## DESCRIPTION
The Get-CIPPScheduledTask function retrieves scheduled tasks from CIPP with optional filtering capabilities.
# PARAMETERS

## **-ShowHidden**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Optional. If specified, includes hidden tasks in the results.

  ## **-Name**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Optional. Filter tasks by name.

  ## **-Type**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Optional. Filter tasks by command type.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPScheduledTask
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPScheduledTask -ShowHidden
```
 #### EXAMPLE 3
```powershell
PS > Get-CIPPScheduledTask -Name "Daily Backup" -Type "Backup"
```

