# Set-CIPPGroupDeliveryManagement
## SYNOPSIS
Sets the delivery management settings for a group.
## DESCRIPTION
The Set-CIPPGroupDeliveryManagement function is used to set the delivery management settings for a group in the CIPP project. It allows you to specify the customer tenant ID, group ID, group type, and whether to only allow internal delivery.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant.

  ## **-GroupID**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the group.

  ## **-GroupType**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The type of the group. Valid values are 'Distribution List', 'Mail-Enabled Security', and 'Microsoft 365'.

  ## **-OnlyAllowInternal**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies whether to only allow internal delivery. Valid values are 'true' and 'false'.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPGroupDeliveryManagement -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -GroupID "67890" -GroupType "Distribution List" -OnlyAllowInternal "true"
```

