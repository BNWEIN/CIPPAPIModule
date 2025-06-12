# Get-CIPPTenantGroups
## SYNOPSIS
Gets tenant groups from the CIPP API.
## DESCRIPTION
The Get-CIPPTenantGroups function retrieves a list of tenant groups from the CIPP API. It can optionally filter by a specific group ID.
# PARAMETERS

## **-GroupID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Optional. The ID of the group to filter by.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPTenantGroups
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPTenantGroups -GroupID "12345678-1234-1234-1234-1234567890AB"
```

