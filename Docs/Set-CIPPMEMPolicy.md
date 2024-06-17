# Set-CIPPMEMPolicy
## SYNOPSIS
Sets the CIPP MEM policy for a customer.
## DESCRIPTION
The Set-CIPPMEMPolicy function is used to set the CIPP (Customer Identity and Protection Platform) MEM (Mobile Endpoint Management) policy for a customer. It allows you to specify the customer tenant ID, policy ID, display name, description, and assignment type.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The unique identifier of the customer tenant.

  ## **-ID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The unique identifier of the policy.

  ## **-DisplayName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The display name of the policy.

  ## **-Description**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The description of the policy.

  ## **-AssignTo**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The assignment type for the policy. Valid values are "allLicensedUsers", "AllDevices", and "AllDevicesAndUsers".

 #### EXAMPLE 1
```powershell
PS > Set-CIPPMEMPolicy -CustomerTenantID "12345678-1234-1234-1234-1234567890ab" -ID "Policy001" -DisplayName "Policy 1" -Description "This is policy 1" -AssignTo "AllDevices"

This example sets the CIPP MEM policy for a customer with the specified parameters.
```

