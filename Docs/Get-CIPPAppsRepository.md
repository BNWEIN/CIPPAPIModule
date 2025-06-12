# Get-CIPPAppsRepository
## SYNOPSIS
Searches for applications in a package repository.
## DESCRIPTION
The Get-CIPPAppsRepository function searches for applications in a specified package repository (defaults to chocolatey.org). 
It returns detailed information about found packages including package name, author, version, and description.
# PARAMETERS

## **-Search**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the search term to find packages. This parameter is mandatory.

  ## **-Repository**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-https://chocolatey.org/api/v2-Blue?color=5547a8)\
Specifies the repository URL to search in. If not specified, defaults to 'https://chocolatey.org/api/v2'.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPAppsRepository -Search 'chrome'
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPAppsRepository -Search 'firefox' -Repository 'https://custom.repository/api/v2'
```

