# Get-CIPPAuditLog
## SYNOPSIS
Gets audit logs from CIPP.
## DESCRIPTION
The Get-CIPPAuditLog function retrieves audit logs from CIPP with various filtering options. It allows filtering by tenant, specific log ID, date range, or relative time period.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant to get logs from. Use 'AllTenants' for logs across all tenants.

  ## **-LogID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
A specific log entry ID to retrieve.

  ## **-StartDate**
> ![Foo](https://img.shields.io/badge/Type-DateTime-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The start date for filtering logs. Accepts DateTime object.

  ## **-EndDate**
> ![Foo](https://img.shields.io/badge/Type-DateTime-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The end date for filtering logs. Accepts DateTime object.

  ## **-RelativeTime**
> ![Foo](https://img.shields.io/badge/Type-TimeSpan-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
A timespan object specifying a relative time period to retrieve logs from. Will be converted to format: Xd (days), Xh (hours), or Xm (minutes).

 #### EXAMPLE 1
```powershell
PS > Get-CIPPAuditLog -CustomerTenantID "12345678-1234-1234-1234-1234567890AB"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPAuditLog -CustomerTenantID "AllTenants" -RelativeTime ([TimeSpan]::FromHours(24))
```
 #### EXAMPLE 3
```powershell
PS > Get-CIPPAuditLog -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -StartDate (Get-Date).AddDays(-7) -EndDate (Get-Date)
```
 #### EXAMPLE 4
```powershell
PS > Get-CIPPAuditLog -LogID "abc123" -CustomerTenantID "tenant1" -RelativeTime ([TimeSpan]::FromDays(1))
```

