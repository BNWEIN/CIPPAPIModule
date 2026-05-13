# Get-CIPPDefenderOnboarding
## SYNOPSIS
Retrieves Microsoft Defender for Endpoint onboarding status.
## DESCRIPTION
The Get-CIPPDefenderOnboarding function retrieves Microsoft Defender for Endpoint onboarding status for a customer tenant. It can query live data or cached report database data when UseReportDB is specified.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the customer tenant ID or default domain name to retrieve onboarding status for. Use 'AllTenants' with UseReportDB to retrieve cached onboarding status for all tenants.

  ## **-UseReportDB**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
When specified, retrieves onboarding status from the CIPP report database instead of live Microsoft Graph data.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPDefenderOnboarding -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPDefenderOnboarding -CustomerTenantID "AllTenants" -UseReportDB
```
 #### EXAMPLE 3
```powershell
PS > Get-CIPPMDEOnboarding -CustomerTenantID "contoso.onmicrosoft.com"
```

