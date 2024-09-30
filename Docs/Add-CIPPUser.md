# Add-CIPPUser
## SYNOPSIS
Adds a user to the specified customer tenant.
## DESCRIPTION
The Add-CIPPUser function adds a user to the specified customer tenant in the CIPP system. It sends a request to the "/api/adduser" endpoint with the provided user details.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant to which the user will be added.

  ## **-DisplayName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The display name of the user.

  ## **-UserName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The username of the user.

  ## **-AutoPassword**
> ![Foo](https://img.shields.io/badge/Type-Boolean-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-True-Blue?color=5547a8)\
Specifies whether to automatically generate a password for the user. Default value is $true.

  ## **-FirstName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The first name of the user.

  ## **-LastName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The last name of the user.

  ## **-Domain**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The domain of the user.

  ## **-AddedAliases**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Additional aliases for the user.

  ## **-CopyFrom**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the user to copy settings from.

  ## **-UsageLocation**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The usage location of the user.

  ## **-Department**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The department of the user.

  ## **-City**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The city of the user.

  ## **-Country**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The country of the user.

  ## **-Jobtitle**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The job title of the user.

  ## **-MobilePhone**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The mobile phone number of the user.

  ## **-BusinessPhone**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The business phone number of the user.

  ## **-StreetAddress**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The street address of the user.

  ## **-PostalCode**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The postal code of the user.

  ## **-CompanyName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The company name of the user.

  ## **-Manager**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The manager of the user. Either the UserPrincipalName(UPN) or the ID of the manager.

  ## **-MustChangePass**
> ![Foo](https://img.shields.io/badge/Type-Boolean-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-True-Blue?color=5547a8)\
Specifies whether the user must change their password on first login. Default value is $true.

  ## **-ScheduledFor**
> ![Foo](https://img.shields.io/badge/Type-DateTime-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the date and time when the user should be added. If not specified, the user will be added immediately. Input should be a valid datetime object. Will be converted to Unix time.

  ## **-SendResultsToEmail**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to send the results of the scheduled task to the email address specified in the notification settings of your CIPP instance.

  ## **-SendResultsToPSA**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to send the results of the scheduled task to the PSA system specified in the notification settings of your CIPP instance.

  ## **-SendResultsToWebhook**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to send the results of the scheduled task to the webhook specified in the notification settings of your CIPP instance.

 #### EXAMPLE 1
```powershell
PS > Add-CIPPUser -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -DisplayName "John Doe" -UserName "johndoe" -FirstName "John" -LastName "Doe" -Domain "example.com" -UsageLocation "US"

Adds a user with the specified details to the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778". The user's display name is "John Doe", username is "johndoe", first name is "John", last name is "Doe", domain is "example.com", and usage location is "US".
```
 #### EXAMPLE 2
```powershell
PS > Add-CIPPUser -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -DisplayName "Jane Smith" -UserName "janesmith" -FirstName "Jane" -LastName "Smith" -Domain "example.com" -UsageLocation "US" -Manager "managerPerson@example.com" -ScheduledFor ((Get-Date).AddDays(1)) -SendResultsToEmail

Adds a user with the specified details to the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".
The user's display name is "Jane Smith", username is "janesmith", first name is "Jane", last name is "Smith", domain is "example.com", and usage location is "US". The user's manager is "managerPerson@example.com".
The user will be added one day from the current date. The results of the scheduled task will be sent to the email address specified in the notification settings of your CIPP instance.
```

