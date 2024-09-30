# Add-CIPPTeam
## SYNOPSIS
Adds a new team site to the specified customer tenant.
## DESCRIPTION
The Add-CIPPTeam function creates a new team site in the specified customer tenant using the provided display name, description, visibility, and owner.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant where the team site will be added. Can be the tenant ID or default domain name.

  ## **-DisplayName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The display name of the new team site.

  ## **-Description**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
A description for the new team site.

  ## **-Visibility**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The visibility setting for the new team site (e.g., Public or Private).

  ## **-Owner**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The owner of the new team site. Should be a valid user principal name (UPN) with a teams license assigned.

 #### EXAMPLE 1
```powershell
PS > Add-CIPPTeam -CustomerTenantID "9d606831-a394-4d1a-b508-260f428807a4" -DisplayName "Engineering Team" -Description "Team for engineering department" -Visibility "Private" -Owner "john.doe@example.com"
```
 #### EXAMPLE 2
```powershell
PS > Add-CIPPTeam -CustomerTenantID "exampleTenant.onmicrosoft.com" -DisplayName "Marketing Team" -Description "Team for marketing department" -Visibility "Public" -Owner "Jane.doe@example.com"
```

