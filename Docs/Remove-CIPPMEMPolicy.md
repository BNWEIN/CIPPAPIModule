# Remove-CIPPMEMPolicy
## SYNOPSIS
Removes a Microsoft Endpoint Manager (MEM) policy.
## DESCRIPTION
The Remove-CIPPMEMPolicy function removes a specified Microsoft Endpoint Manager policy from CIPP.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

  ## **-PolicyId**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the policy to remove.

  ## **-UrlName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the URL name for the policy type in the Graph API (e.g., 'configurationPolicies', 'deviceConfigurations').

 #### EXAMPLE 1
```powershell
PS > Remove-CIPPMEMPolicy -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -PolicyId "98765432-4321-4321-4321-BA0987654321" -UrlName "configurationPolicies"
```

