# Get-CIPPUniversalSearch
## SYNOPSIS
Performs a universal search for a specified name.
## DESCRIPTION
The Get-CIPPUniversalSearch function performs a universal search for a specified name by making a REST API call to the /api/execuniversalsearch endpoint.
# PARAMETERS

## **-Name**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The name to search for.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPUniversalSearch -Name "John Doe"
```

