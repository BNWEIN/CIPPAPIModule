# Get-CIPPBPA
## SYNOPSIS
Retrieves the BPA (Best Practices Analyzer) report for a specific customer tenant.
## DESCRIPTION
The Get-CIPPBPA function retrieves the BPA report for a customer tenant based on the provided CustomerTenantID. 
Optionally, you can specify a ReportName to filter the report.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the ID of the customer tenant for which to retrieve the BPA report. This parameter is optional.

  ## **-ReportName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the name of the report to filter the BPA report. This parameter is optional.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPBPA -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -ReportName "CIPP Best Practices V1.0 - Tenant View"

This example retrieves the BPA report for the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" and filters it by the report name "CIPP Best Practices V1.0 - Tenant View".
```

