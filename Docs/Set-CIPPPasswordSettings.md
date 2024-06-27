# Set-CIPPPasswordSettings
## SYNOPSIS
Sets or gets the CIPP password settings.
## DESCRIPTION
The Set-CIPPPasswordSettings function is used to view the password settings for CIPP or to set them.
# PARAMETERS

## **-Type**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the type of password settings to be set. Valid values are "Correct-Battery-Horse" and "Classic".

  ## **-List**
> ![Foo](https://img.shields.io/badge/Type-Boolean-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to list the current password settings. If set to $true, the function will retrieve the current password settings.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPPasswordSettings -Type "Correct-Battery-Horse"
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPPasswordSettings -List $true
```

