# Set-CIPPAPIDetails
## SYNOPSIS
Sets the CIPP API connection details and validates the module version.
## DESCRIPTION
The Set-CIPPAPIDetails function is used to configure the CIPP API connection details, 
including the client ID, client secret, API URL, and tenant ID. These credentials are 
stored in script-scoped variables for use by all subsequent API operations.

This function also performs a module update check during initialization to alert users 
if a newer version of CIPPAPIModule is available on the PowerShell Gallery. This check 
occurs once during setup rather than on every API call for optimal performance.
# PARAMETERS

## **-CIPPClientID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the client ID for the CIPP API application registration.

  ## **-CIPPClientSecret**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the client secret for the CIPP API application registration.

  ## **-CIPPAPIUrl**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the base URL for the CIPP API endpoint.

  ## **-TenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the Azure AD tenant ID used for OAuth authentication.

  ## **-SkipVersionCheck**
> ![Foo](https://img.shields.io/badge/Type-SwitchParameter-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
When specified, bypasses the module update check during initialization. Use this  parameter in automated scenarios where version checking should be deferred or skipped.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPAPIDetails -CIPPClientID "d8d41058-97df-4b80-8e1b-7083d756409f" -CIPPClientSecret "YourSecurePassword" -CIPPAPIUrl "https://api.cipp.com" -TenantID "7c2f78c0-554e-4f42-a663-c4df3ce7f51f"

This example sets the CIPP API details with version checking enabled.
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPAPIDetails -CIPPClientID "d8d41058-97df-4b80-8e1b-7083d756409f" -CIPPClientSecret "YourSecurePassword" -CIPPAPIUrl "https://api.cipp.com" -TenantID "7c2f78c0-554e-4f42-a663-c4df3ce7f51f" -SkipVersionCheck

This example sets the CIPP API details while skipping the module version check.
```

