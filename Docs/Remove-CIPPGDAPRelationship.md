# Remove-CIPPGDAPRelationship
## SYNOPSIS
Removes a GDAP (Global Data Access Point) relationship.
## DESCRIPTION
The Remove-CIPPGDAPRelationship function terminates a GDAP relationship by invoking a REST API endpoint.
# PARAMETERS

## **-GDAPID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the GDAP relationship to be terminated.

 #### EXAMPLE 1
```powershell
PS > Remove-CIPPGDAPRelationship -GDAPID "59a6b837-2c8d-4f91-93e1-746cd82b1e37-a9d8b5e2-73cf-41a5-8de7-134f62b0c6e9"
```

