# Set-CIPPCreateTap
## SYNOPSIS
Creates a TAP (Temporary Access Passcode) for a user.
## DESCRIPTION
The Set-CIPPCreateTap function is used to create a TAP (Temporary Access Passcode) for a user in the CIPP system.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant for which the TAP is being created. This parameter is mandatory.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the user for whom the TAP is being created. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPCreateTap -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "user@domain.com"
```

