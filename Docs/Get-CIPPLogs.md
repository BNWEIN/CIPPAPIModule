# Get-CIPPLogs
## SYNOPSIS
Retrieves CIPP logs from the API.
## DESCRIPTION
The Get-CIPPLogs function retrieves logs from the CIPP API by invoking the "/api/ListLogs" endpoint.
# PARAMETERS
## Severity
Accepts any of: debug,info,warn,error,critical,alert

## DateFilter
Date in local time, in any format Get-Date can ingest. This gets converted to UTC.

#### EXAMPLE 1
```powershell
PS > Get-CIPPLogs
```

#### EXAMPLE 2
```powershell
PS > Get-CIPPLogs -Severity "Alert" -DateFilter "07/10/2024"
```

