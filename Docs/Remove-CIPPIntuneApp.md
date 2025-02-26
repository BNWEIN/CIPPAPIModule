# Remove-CIPPIntuneApp
## SYNOPSIS
Removes an Intune application.
## DESCRIPTION
The Remove-CIPPIntuneApp function removes an application from Intune.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant. This parameter is mandatory.

  ## **-AppID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the application to remove. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Remove-CIPPIntuneApp -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -AppID "98765432-4321-4321-4321-0987654321BA"
```

