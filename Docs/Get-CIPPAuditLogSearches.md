# Get-CIPPAuditLogSearches
## SYNOPSIS
Retrieves audit log searches for a specific customer.
## DESCRIPTION
The Get-CIPPAuditLogSearches function retrieves audit log searches for a specific customer identified by their tenant ID.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The tenant ID of the customer for whom to retrieve the audit log searches.

  ## **-SearchId**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The ID of the search to retrieve results for.

  ## **-Days**
> ![Foo](https://img.shields.io/badge/Type-Int32-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-0-Blue?color=5547a8)\
The number of days to retrieve audit log searches for.

  ## **-Type**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The type of search to perform (e.g., 'Searches', 'SearchResults').

 #### EXAMPLE 1
```powershell
PS > Get-CIPPAuditLogSearches -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -Type "Searches"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPAuditLogSearches -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -SearchId "12345" -Type "SearchResults"
```

