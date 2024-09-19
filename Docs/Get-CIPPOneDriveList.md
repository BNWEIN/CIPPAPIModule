# Get-CIPPOneDriveList
## SYNOPSIS
Retrieves a list of OneDrive sites for a specified customer tenant.
## DESCRIPTION
The Get-CIPPOneDriveList function retrieves a list of OneDrive sites for a specified customer tenant. It uses the Invoke-CIPPRestMethod function to make a REST API call to retrieve the sites.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which to retrieve the OneDrive sites.

  ## **-urlonly**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to return only the URLs of the OneDrive sites. If this switch is used, only the URLs will be returned.

  ## **-UserUPN**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The user's UPN (User Principal Name) for which to retrieve the OneDrive sites. This parameter is optional.

 #### EXAMPLE 1
```powershell
PS>Get-CIPPOneDriveList -CustomerTenantID "example.com"

Retrieves a list of OneDrive sites for the customer tenant with the ID "example.com".
```
 #### EXAMPLE 2
```powershell
PS>Get-CIPPOneDriveList -CustomerTenantID "example.com" -urlonly

Retrieves a list of OneDrive site URLs for the customer tenant with the ID "example.com".
```
 #### EXAMPLE 3
```powershell
PS>Get-CIPPOneDriveList -CustomerTenantID "example.com" -UserUPN "user@example.com"

Retrieves a list of OneDrive sites for the customer tenant with the ID "example.com" and the specified user's UPN "user@example.com".
```

