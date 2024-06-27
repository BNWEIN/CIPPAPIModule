# Set-CIPPExcludeLicense
## SYNOPSIS
Sets the exclusion status of a license in CIPP.
## DESCRIPTION
The Set-CIPPExcludeLicense function is used to set the exclusion status of a license in CIPP. It allows you to add or remove a license from the exclusion list.
# PARAMETERS

## **-LicenseGUID**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the GUID of the license to be excluded or included.

  ## **-SKUName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the SKU name of the license.

  ## **-RemoveExclusion**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Indicates whether to remove the license from the exclusion list. This switch cannot be used together with the -AddExclusion switch.

  ## **-AddExclusion**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Indicates whether to add the license to the exclusion list. This switch cannot be used together with the -RemoveExclusion switch.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPExcludeLicense -LicenseGUID "12345678-1234-1234-1234-1234567890AB" -SKUName "ExampleSKU" -RemoveExclusion
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPExcludeLicense -LicenseGUID "12345678-1234-1234-1234-1234567890AB" -SKUName "ExampleSKU" -AddExclusion
```

