# Get-CIPPSafeAttachmentFilter
## SYNOPSIS
Gets safe attachments filter settings.
## DESCRIPTION
The Get-CIPPSafeAttachmentFilter function retrieves safe attachments policies and rules configured in Exchange Online for a tenant.
The output combines policy settings with their associated rules.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPSafeAttachmentFilter -CustomerTenantID "12345678-1234-1234-1234-1234567890AB"
```

