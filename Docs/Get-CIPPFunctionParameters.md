# Get-CIPPFunctionParameters
## SYNOPSIS
Retrieves the parameters of a CIPP function.
## DESCRIPTION
The Get-CIPPFunctionParameters function is used to retrieve the parameters of a CIPP function. It sends a request to the "/api/ListFunctionParameters" endpoint and returns the response.
# PARAMETERS

## **-Module**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the name of the module containing the function. This parameter is optional.

  ## **-Function**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the name of the function. This parameter is optional.

  ## **-Compliance**
> ![Foo](https://img.shields.io/badge/Type-Boolean-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to retrieve compliance-related parameters. This parameter is optional and defaults to $false.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPFunctionParameters -Module "CIPPCore" -Function "Set-CIPPUserLicense"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPFunctionParameters -Module "CIPPCore"
```

