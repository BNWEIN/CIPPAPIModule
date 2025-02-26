# Remove-CIPPSpamFilter
## SYNOPSIS
Removes a spam filter rule and policy.
## DESCRIPTION
The Remove-CIPPSpamFilter function removes a specified spam filter rule and its associated policy from Exchange in CIPP.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

  ## **-Name**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the name of the spam filter rule and policy to remove.

 #### EXAMPLE 1
```powershell
PS > Remove-CIPPSpamFilter -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -Name "Block Spam Policy"
```

