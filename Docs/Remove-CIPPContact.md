# Remove-CIPPContact
## SYNOPSIS
Removes a mail contact from Exchange.
## DESCRIPTION
The Remove-CIPPContact function removes a specified mail contact from Exchange in CIPP.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

  ## **-ContactGuid**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the GUID of the mail contact to remove.

 #### EXAMPLE 1
```powershell
PS > Remove-CIPPContact -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -ContactGuid "98765432-4321-4321-4321-BA0987654321"
```

