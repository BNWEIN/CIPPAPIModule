# Get-CIPPDomainAnalyser
## SYNOPSIS
Retrieves the list of domain analyzers for a specific customer tenant.
## DESCRIPTION
The Get-CIPPDomainAnalyser function retrieves the list of domain analyzers associated with a specific customer tenant. It makes a REST API call to retrieve the list of domain analyzers based on the provided customer tenant ID.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which to retrieve the domain analyzers.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPDomainAnalyser -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

