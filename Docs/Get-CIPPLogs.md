# Get-CIPPLogs
## SYNOPSIS
Retrieves CIPP logs from the API.
## DESCRIPTION
The Get-CIPPLogs function retrieves logs from the CIPP API by invoking the "/api/ListLogs" endpoint.
# PARAMETERS

## **-Severity**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Accepts any of: debug,info,warn,error,critical,alert. If DateFilter is not specified alongside, it assumes current date in local time.

  ## **-DateFilter**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-(Get-Date -Format "yyyyMMdd")-Blue?color=5547a8)\
Date in "yyyyMMdd" format. This should be in the time zone of your CIPP instance (default UTC).

 #### EXAMPLE 1
```powershell
PS > Get-CIPPLogs
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPLogs -Severity "Alert" -DateFilter "20240711"
```

