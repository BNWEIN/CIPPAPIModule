# Get-CIPPGetBitLockerKey
## SYNOPSIS
Gets the BitLocker recovery key for a specified computer.
## DESCRIPTION
The Get-CIPPGetBitLockerKey function retrieves the BitLocker recovery key for a specified computer in the CIPP project.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant.

  ## **-GUID**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the GUID of the computer for which to retrieve the BitLocker recovery key.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPGetBitLockerKey -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -guid "01234567-89AB-CDEF-0123-456789ABCDEF"
```

