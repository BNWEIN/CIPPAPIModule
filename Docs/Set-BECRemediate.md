# Set-BECRemediate
## SYNOPSIS
Runs BEC Remediation for a specified user.
## DESCRIPTION
The Set-BECRemediate function is used to initiate BEC (Business Email Compromise) remediation for a specified user.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer's tenant.

  ## **-Username**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the username of the user to remediate.

  ## **-Userid**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the user to remediate.

 #### EXAMPLE 1
```powershell
PS > Set-BECRemediate -CustomerTenantID "contoso.onmicrosoft.com" -Username "john.doe@contoso.onmicrosoft.com" -Userid "a75d9c41-4cff-4017-8ddd-d413591c8c1e"

This example runs BEC remediation for the user with the username "john.doe@contoso.onmicrosoft.com" and the ID "a75d9c41-4cff-4017-8ddd-d413591c8c1e" in the customer's tenant with the ID "contoso.onmicrosoft.com".
```

