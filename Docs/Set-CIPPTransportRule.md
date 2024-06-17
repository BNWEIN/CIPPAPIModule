# Set-CIPPTransportRule
## SYNOPSIS
Sets the state of a transport rule for a specific customer tenant.
## DESCRIPTION
The Set-CIPPTransportRule function is used to set the state of a transport rule for a specific customer tenant in the CIPP API.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which the transport rule needs to be edited.

  ## **-State**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The state to set for the transport rule. Valid values are "Enable" and "Disable".

  ## **-Guid**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The GUID of the transport rule to be edited.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPTransportRule -CustomerTenantID "contoso.onmicrosoft.com" -State "Enable" -Guid "abcdefg"
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPTransportRule -CustomerTenantID "contoso.onmicrosoft.com" -State "Disable" -Guid "hijklmn"
```

