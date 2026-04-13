# Get-CIPPLogs
## SYNOPSIS
Retrieves CIPP logs from the API.
## DESCRIPTION
The Get-CIPPLogs function retrieves logs from the CIPP API by invoking the "/api/ListLogs" endpoint.
You can filter logs by severity level and date range using the available parameters.
# PARAMETERS

## **-Severity**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Filters logs by severity level. Accepts any of: debug, info, warn, error, critical, alert. If DateFilter is not specified alongside, it assumes current date in local time.

  ## **-DateFilter**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-(Get-Date -Format 'yyyyMMdd')-Blue?color=5547a8)\
Date in "yyyyMMdd" format. Defaults to current date if not specified. This should be in the time zone of your CIPP instance (default UTC).

  ## **-StartDate**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Start date for filtering logs in "yyyyMMdd" format. Use with EndDate to specify a date range.

  ## **-EndDate**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
End date for filtering logs in "yyyyMMdd" format. Use with StartDate to specify a date range.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPLogs
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPLogs -Severity "Alert" -DateFilter "20240711"
```
 #### EXAMPLE 3
```powershell
PS > Get-CIPPLogs -StartDate "20240701" -EndDate "20240731"
```
 #### EXAMPLE 4
```powershell
PS > Get-CIPPLogs -Severity "Error" -StartDate "20240701" -EndDate "20240731"
```

