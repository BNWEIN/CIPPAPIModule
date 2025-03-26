# Clear-CIPPImmutableID
## SYNOPSIS
Clears the Immutable ID for a user in a specified tenant.
## DESCRIPTION
The Clear-CIPPImmutableID function removes the Immutable ID attribute from a user account in a specified tenant.
This is commonly used when migrating users or fixing synchronization issues between on-premises Active Directory and Azure AD.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The tenant ID of the customer where the user exists. This parameter is mandatory and should be in the format of a domain name (e.g., "contoso.onmicrosoft.com") or the tenant ID.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user whose Immutable ID will be cleared. Can be either the user's UserPrincipalName (UPN) or their GUID. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Clear-CIPPImmutableID -CustomerTenantID "contoso.onmicrosoft.com" -UserID "user@contoso.com"
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPClrImmID -CustomerTenantID "fabrikam.onmicrosoft.com" -UserID "12345678-1234-1234-1234-123456789012"
```

