# Set-CIPPCalendarPermissions
## SYNOPSIS
Sets calendar permissions for a user in a customer's tenant.
## DESCRIPTION
The Set-CIPPCalendarPermissions function is used to edit calendar permissions for a specified user in a customer's tenant. It allows you to set different levels of permissions for the user on the calendar folder.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer's tenant.

  ## **-Permissions**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the level of permissions to be set for the user on the calendar folder. Valid values are: - Author - Contributor - Editor - Owner - Non Editing Author - Publishing Author - Publishing Editor - Reviewer - LimitedDetails - AvailabilityOnly

  ## **-Userid**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the user for whom the calendar permissions are being set.

  ## **-RemoveAccess**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies whether to remove the user's access to the calendar folder. This parameter is optional.

  ## **-usertogetpermissions**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the ID of the user for whom you are giving permission to. This parameter is optional.

  ## **-FolderName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-Calendar-Blue?color=5547a8)\
Specifies the name of the calendar folder. The default value is "Calendar".

 #### EXAMPLE 1
```powershell
PS > Set-CIPPCalendarPermissions -CustomerTenantID "contoso.onmicrosoft.com" -Permissions "Editor" -Userid "user@example.com"

This example sets the calendar permissions for the user with the ID "user@example.com" in the customer's tenant with the ID "contoso.onmicrosoft.com" to "Editor" level.
```

