# Get-CIPPConditionalAccessPolicyChanges
## SYNOPSIS
Retrieves conditional access policy changes for a specific customer.
## DESCRIPTION
The Get-CIPPConditionalAccessPolicyChanges function retrieves conditional access policy changes for a specific customer identified by their tenant ID.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The tenant ID of the customer for whom to retrieve the conditional access policy changes.

  ## **-PolicyId**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The ID of the policy for which to retrieve changes.

  ## **-PolicyDisplayName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The display name of the policy for which to retrieve changes.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPConditionalAccessPolicyChanges -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -PolicyId "12345" -PolicyDisplayName "Example Policy"
```

