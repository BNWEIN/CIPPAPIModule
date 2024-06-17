# Get-CIPPAuditLogTest
## SYNOPSIS
Retrieves audit logs for a specified customer tenant.
## DESCRIPTION
The Get-CIPPAuditLogTest function retrieves audit logs for a specified customer tenant based on the log type.
# PARAMETERS

## **-CustomerTenantId**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant for which to retrieve audit logs.

  ## **-LogType**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the type of audit logs to retrieve. Valid values are 'Audit.Exchange' and 'Audit.AzureActiveDirectory'.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPAuditLogTest -CustomerTenantId "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -LogType "Audit.Exchange"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPAuditLogTest -CustomerTenantId "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -LogType "Audit.AzureActiveDirectory"
```
 #### EXAMPLE 3
```powershell
PS > Get-CIPPAuditLogTest -CustomerTenantId "test.onmicrosoft.com" -LogType "Audit.Exchange"
```

