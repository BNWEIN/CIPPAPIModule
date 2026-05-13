# Set-CIPPTenantGroup
## SYNOPSIS
Creates or updates a CIPP tenant group.
## DESCRIPTION
The Set-CIPPTenantGroup function creates or updates a tenant group in CIPP using the ExecTenantGroup endpoint.
For static groups, the provided Members list is used as a full replacement of the current membership --
include all desired members (existing and new) in a single call.
# PARAMETERS

## **-GroupName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The display name of the tenant group.

  ## **-GroupId**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Optional. The GUID of the group to update. If omitted, a new GUID is generated and a new group is created.

  ## **-GroupDescription**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Optional. A description for the tenant group.

  ## **-GroupType**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-static-Blue?color=5547a8)\
Optional. The type of group: 'static' (manually managed members) or 'dynamic' (rule-based). Defaults to 'static'.

  ## **-Members**
> ![Foo](https://img.shields.io/badge/Type-Array-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Optional. An array of member hashtables for static groups. Each entry must contain:   value - the tenant customerId (GUID)   label - the tenant display name

 #### EXAMPLE 1
```powershell
PS > Set-CIPPTenantGroup -GroupName 'Complea Spamfilter' -GroupId '12345678-1234-1234-1234-1234567890AB' -Members @(
)
Creates or updates the 'Complea Spamfilter' group with the specified members.
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPTenantGroup -GroupName 'New Group' -GroupDescription 'A new static tenant group'
```

