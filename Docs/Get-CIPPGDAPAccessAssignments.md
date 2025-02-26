# Get-CIPPGDAPAccessAssignments
## SYNOPSIS
Retrieves GDAP access assignments for a specific customer.
## DESCRIPTION
The Get-CIPPGDAPAccessAssignments function retrieves GDAP access assignments for a specific customer identified by their tenant ID.
# PARAMETERS

## **-Id**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the access assignment to retrieve.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPGDAPAccessAssignments -Id "12345"
```

