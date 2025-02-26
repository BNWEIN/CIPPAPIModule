# Get-CIPPGDAPInvite
## SYNOPSIS
Gets GDAP invites.
## DESCRIPTION
The Get-CIPPGDAPInvite function retrieves Granular Delegated Admin Privileges (GDAP) invites from CIPP.
# PARAMETERS

## **-RelationshipId**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Optional. The specific relationship ID to retrieve. If not specified, returns all invites.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPGDAPInvite
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPGDAPInvite -RelationshipId "12345678-1234-1234-1234-1234567890AB"
```

