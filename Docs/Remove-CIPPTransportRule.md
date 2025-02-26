# Remove-CIPPTransportRule
## SYNOPSIS
Removes an Exchange transport rule.
## DESCRIPTION
The Remove-CIPPTransportRule function removes a specified transport rule from Exchange in CIPP.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

  ## **-RuleGuid**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the GUID of the transport rule to remove.

 #### EXAMPLE 1
```powershell
PS > Remove-CIPPTransportRule -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -RuleGuid "98765432-4321-4321-4321-BA0987654321"
```

