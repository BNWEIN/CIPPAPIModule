# Set-CIPPStandardsRun
## SYNOPSIS
Runs standards for a specific customer tenant.
## DESCRIPTION
The Set-CIPPStandardsRun function runs standards for a specific customer tenant by invoking a REST API endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which the standards should be run.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPStandardsRun -CustomerTenantID "contoso.onmicrosoft.com"
```

