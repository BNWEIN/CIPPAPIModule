# Get-CIPPTransportRules
## SYNOPSIS
Retrieves transport rules for a specified customer tenant ID.
## DESCRIPTION
The Get-CIPPTransportRules function retrieves transport rules for a specified customer tenant ID using the CIPP API.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The unique identifier of the customer tenant for which to retrieve the transport rules.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPTransportRules -CustomerTenantID "contoso.onmicrosoft.com"
```

