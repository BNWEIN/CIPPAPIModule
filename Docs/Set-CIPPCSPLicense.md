# Set-CIPPCSPLicense
## SYNOPSIS
Manages CSP licenses for a tenant.
## DESCRIPTION
The Set-CIPPCSPLicense function manages Cloud Solution Provider (CSP) licenses for a specified tenant in the CIPP system.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

  ## **-LicenseId**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the CSP license to manage.

  ## **-Action**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the action to perform on the license. Valid values are 'Add', 'Remove', or 'Update'.

  ## **-Quantity**
> ![Foo](https://img.shields.io/badge/Type-Int32-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-0-Blue?color=5547a8)\
Specifies the number of licenses to add or update. Only applicable for 'Add' or 'Update' actions.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPCSPLicense -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -LicenseId "CFQ7TTC0LH16" -Action Add -Quantity 5
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPCSPLicense -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -LicenseId "CFQ7TTC0LH16" -Action Remove
```

