# Set-CIPPOOO
## SYNOPSIS
Sets the out of office settings for a user.
## DESCRIPTION
The Set-CIPPOOO function is used to set the out of office settings for a user in a customer's Exchange environment. It allows you to specify the customer tenant ID, user, auto reply state, external message, internal message, start time, and end time for the out of office settings.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer's tenant.

  ## **-User**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The user for whom the out of office settings should be set.

  ## **-autoreplystate**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The auto reply state. Valid values are 'Scheduled', 'Disabled', or 'Enabled'.

  ## **-externalmessage**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The external message to be sent as an auto reply.

  ## **-internalmessage**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The internal message to be sent as an auto reply.

  ## **-endtime**
> ![Foo](https://img.shields.io/badge/Type-DateTime-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The end time for the out of office settings. This parameter is mandatory when autoreplystate is 'Scheduled'.

  ## **-starttime**
> ![Foo](https://img.shields.io/badge/Type-DateTime-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The start time for the out of office settings. This parameter is mandatory when autoreplystate is 'Scheduled'.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPOOO -CustomerTenantID "contoso.onmicrosoft.com" -User "john.doe@contoso.onmicrosoft.com" -autoreplystate "Disabled"
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPOOO -CustomerTenantID "contoso.onmicrosoft.com" -User "john.doe@contoso.onmicrosoft.com" -autoreplystate "Enabled"
```
 #### EXAMPLE 3
```powershell
PS > Set-CIPPOOO -CustomerTenantID "contoso.onmicrosoft.com" -User "john.doe@contoso.onmicrosoft.com" -autoreplystate "Enabled" -externalmessage "I'm currently out of office." -internalmessage "I'm currently out of office." -starttime 2024-06-21 14:00" -endtime "2024-06-21 14:30""
```

