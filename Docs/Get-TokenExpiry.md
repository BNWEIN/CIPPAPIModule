# Get-TokenExpiry
## SYNOPSIS
Calculates the expiry date and time for a token.
## DESCRIPTION
The Get-TokenExpiry function calculates the expiry date and time for a token based on the token's expiration time in seconds.
# PARAMETERS

## **-ExpiresIn**
> ![Foo](https://img.shields.io/badge/Type-Int64-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-$script:ExpiresIn-Blue?color=5547a8)\
Specifies the expiration time of the token in seconds. If not provided, the function uses the default expiration time stored in the $script:ExpiresIn variable.

 #### EXAMPLE 1
```powershell
PS > Get-TokenExpiry -ExpiresIn 3600
```

