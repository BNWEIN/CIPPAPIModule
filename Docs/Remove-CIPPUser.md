# Remove-CIPPUser
## SYNOPSIS
Removes a user from a specified tenant.
## DESCRIPTION
The Remove-CIPPUser function deletes a user identified by their UserID from a specified tenant identified by the CustomerTenantID. 
It sends a request to the '/api/RemoveUser' endpoint to perform the deletion.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the tenant from which the user will be removed. This parameter is mandatory.

  ## **-User**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The unique identifier (GUID) or UserPrincipalName(UPN) of the user to be removed. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Remove-CIPPUser -CustomerTenantID "tenant123.domain.com" -UserID "e7402930-efc9-4ba8-a959-ae7fc6c15021"
```
 #### EXAMPLE 2
```powershell
PS > Remove-CIPPUser -CustomerTenantID "3939eb14-06b3-4287-aea7-defe129c6741" -UserID "user@domaion.com"
```

