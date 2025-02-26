# Remove-CIPPIntuneScript
## SYNOPSIS
Removes an Intune script.
## DESCRIPTION
The Remove-CIPPIntuneScript function removes a specified script from Microsoft Intune.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

  ## **-ScriptID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the script to remove.

  ## **-ScriptType**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the type of script to remove. Valid values are: - Windows (Device Management Scripts) - MacOS (Shell Scripts) - Remediation (Device Health Scripts) - Linux (Configuration Policies)

  ## **-DisplayName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the display name of the script being removed. Used for logging purposes.

 #### EXAMPLE 1
```powershell
PS > Remove-CIPPIntuneScript -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -ScriptID "87654321-4321-4321-4321-BA0987654321" -ScriptType "Windows" -DisplayName "Windows Cleanup Script"
```

