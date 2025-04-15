# Invoke-CIPPPreFlightCheck
## SYNOPSIS
Performs necessary checks before making CIPP API calls.
## DESCRIPTION
The Invoke-CIPPPreFlightCheck function validates that all required CIPP API connection 
variables are set, checks for module updates, and ensures the authentication token is valid.

If the authentication token is missing or expired, it automatically attempts to reconnect 
to the CIPP API using the stored credentials.

This function should be called before any API operation to ensure proper connectivity.
# PARAMETERS

## **-SkipVersionCheck**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
When specified, bypasses the check for module updates. This can be useful in automated scenarios or when you want to avoid the potential delay of version checking.

 #### EXAMPLE 1
```powershell
PS > Invoke-CIPPPreFlightCheck

Performs all pre-flight checks including module update verification.
```
 #### EXAMPLE 2
```powershell
PS > Invoke-CIPPPreFlightCheck -SkipVersionCheck
```

