# Set-CIPPSpamFilter
## SYNOPSIS
Sets the state of a spam filter for a customer's tenant.
## DESCRIPTION
The Set-CIPPSpamFilter function is used to edit the state of a spam filter for a customer's tenant. It takes the customer's tenant ID, a unique identifier (optional), the name of the spam filter, and the desired state (Enable or Disable) as parameters.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer's tenant.

  ## **-Guid**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
A unique identifier for the spam filter. This parameter is optional.

  ## **-Name**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The name of the spam filter.

  ## **-State**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The desired state of the spam filter. Valid values are "Enable" or "Disable".

 #### EXAMPLE 1
```powershell
PS > Set-CIPPSpamFilter -CustomerTenantID "contoso.onmicrosoft.com" -Name "SpamFilter1" -State "Enable"
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPSpamFilter -CustomerTenantID "contoso.onmicrosoft.com" -Guid "abcdefg" -Name "SpamFilter2" -State "Disable"
```

