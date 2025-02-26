# Get-CIPPFunctionStats
## SYNOPSIS
Gets CIPP function statistics.
## DESCRIPTION
The Get-CIPPFunctionStats function retrieves statistical information about CIPP function usage and performance.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant to filter results for. Use 'AllTenants' to view all tenants.

  ## **-FunctionType**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-Durable-Blue?color=5547a8)\
Specifies the type of functions to retrieve stats for. Defaults to 'Durable'.

  ## **-LookbackPeriod**
> ![Foo](https://img.shields.io/badge/Type-TimeSpan-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
A timespan object specifying how far back to retrieve stats from. Will be converted to appropriate interval (days, hours, or minutes).

 #### EXAMPLE 1
```powershell
PS > Get-CIPPFunctionStats -CustomerTenantID "AllTenants" -FunctionType "Durable" -LookbackPeriod ([TimeSpan]::FromDays(7))
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPFunctionStats -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -LookbackPeriod ([TimeSpan]::FromHours(24))
```

