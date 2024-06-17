# Get-CIPPAutoPilotConfig
## SYNOPSIS
Retrieves AutoPilot configuration information for a specified customer tenant ID and type.
## DESCRIPTION
The Get-CIPPAutoPilotConfig function retrieves AutoPilot configuration information for a specified customer tenant ID and type. 
It makes a REST API call to retrieve the configuration data.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the customer tenant ID for which to retrieve the AutoPilot configuration.

  ## **-Type**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the type of AutoPilot configuration to retrieve. Valid values are "ESP" and "ApProfile".

 #### EXAMPLE 1
```powershell
PS > Get-CIPPAutoPilotConfig -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -Type "ESP"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPAutoPilotConfig -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -Type "ApProfile"
```

