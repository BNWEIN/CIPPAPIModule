# Get-CIPPExchangeConnectors
## SYNOPSIS
Retrieves Exchange Connectors for a specific customer.
## DESCRIPTION
The Get-CIPPExchangeConnectors function retrieves Exchange Connectors for a specific customer based on the provided CustomerTenantID.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the unique identifier of the customer's tenant.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPExchangeConnectors -CustomerTenantID "Get-CIPPEnabledSharedMailboxes"
```

