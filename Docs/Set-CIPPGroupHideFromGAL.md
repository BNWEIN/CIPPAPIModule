# Set-CIPPGroupHideFromGAL
## SYNOPSIS
Sets the "hide from GAL" property for a specified group.
## DESCRIPTION
The Set-CIPPGroupHideFromGAL function is used to set the "hide from GAL" property for a specified group in the CIPP (Cloud Identity and Privacy Protection) system. This function requires the customer tenant ID, group ID, group type, and the hide from GAL value as input parameters.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant. This parameter is mandatory.

  ## **-GroupID**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the group. This parameter is mandatory.

  ## **-Grouptype**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the type of the group. Valid values are 'Distribution List', 'Mail-Enabled Security', 'Microsoft 365', and 'Security'. This parameter is mandatory.

  ## **-hidefromgal**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies whether the group should be hidden from the Global Address List (GAL). Valid values are 'true' and 'false'. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPGroupHideFromGAL -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -GroupID "98765432-4321-4321-4321-0987654321BA" -GroupType "Distribution List" -HideFromGAL "true"
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPGroupHideFromGAL -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -GroupID "98765432-4321-4321-4321-0987654321BA" -GroupType "Security" -HideFromGAL "false"
```

