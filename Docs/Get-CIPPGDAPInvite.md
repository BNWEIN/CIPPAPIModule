# Get-CIPPGDAPInvite
## SYNOPSIS
Creates a GDAP (Granular Delegated Admin Privileges) invite.
## DESCRIPTION
The Get-CIPPGDAPInvite function sends a request to create a GDAP invite using the specified GDAP roles. 
You can either provide a custom set of roles using the `-GDAPRoles` parameter or include all existing roles by using the `-UseAllExistingRoles` switch.
# PARAMETERS

## **-GDAPRoles**
> ![Foo](https://img.shields.io/badge/Type-Array-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
An array of GDAP roles to be included in the invite. Each role is represented as a hashtable with the following keys: - `GroupName`: The name of the role group. - `GroupId`: The unique identifier of the role group. - `RoleName`: The name of the specific role. - `roleDefinitionId`: The unique identifier for the role definition.

  ## **-UseAllExistingRoles**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
A switch parameter that, when specified, includes all existing roles in the GDAP invite. This is mutually exclusive with `-GDAPRoles`.

 #### EXAMPLE 1
```powershell
PS C:\>Get-CIPPGDAPInvite -GDAPRoles @(@{GroupName="M365 GDAP Cloud Device Administrator";GroupId="fa03defa-27c4-4639-8e50-14cbb746a78d";RoleName="Cloud Device Administrator";roleDefinitionId="7698a772-787b-4ac8-901f-60d6b08affd2"},@{GroupName="M365 GDAP Intune Administrator";GroupId="3d1c917f-8d1e-4a1e-a61c-df3263a0d1bc";RoleName="Intune Administrator";roleDefinitionId="3a2c62db-5318-420d-8d74-23affee5d9d5"})

This example creates a GDAP invite with the roles "Cloud Device Administrator" and "Intune Administrator."
```
 #### EXAMPLE 2
```powershell
PS C:\>Get-CIPPGDAPInvite -UseAllExistingRoles

This example creates a GDAP invite including all existing roles retrieved by the `Get-CIPPGDAPRoles` function.
```

