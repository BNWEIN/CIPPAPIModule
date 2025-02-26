# Get-CIPPBackup
## SYNOPSIS
Lists CIPP backups.
## DESCRIPTION
The Get-CIPPBackup function retrieves a list of CIPP backups, with optional filtering capabilities.
# PARAMETERS

## **-Type**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Optional. Filter backups by type.

  ## **-TenantFilter**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Optional. Filter backups by tenant.

  ## **-BackupName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Optional. Filter backups by name.

  ## **-NameOnly**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Optional. When specified, returns only backup names and timestamps.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPBackup
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPBackup -Type "Configuration" -TenantFilter "contoso.com"
```
 #### EXAMPLE 3
```powershell
PS > Get-CIPPBackup -NameOnly
```

