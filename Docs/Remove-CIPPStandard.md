# Remove-CIPPStandard
## SYNOPSIS
Removes standards for a specified customer domain.
## DESCRIPTION
The Remove-CIPPStandard function removes standards associated with a given customer domain by calling the appropriate API endpoint.
# PARAMETERS

## **-CustomerDefaultDomain**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The default domain of the customer for which the standards are to be removed. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Remove-CIPPStandard -CustomerDefaultDomain "example.com"
```

