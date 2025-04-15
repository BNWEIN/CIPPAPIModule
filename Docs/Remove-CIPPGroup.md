# Remove-CIPPGroup
## SYNOPSIS
Removes a CIPP group.
## DESCRIPTION
The Remove-CIPPGroup function is used to remove a CIPP group from the specified customer tenant.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant.

  ## **-GroupID**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the group to be removed.

  ## **-GroupType**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The type of the group.

  ## **-DisplayName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The display name of the group.

 #### EXAMPLE 1
```powershell
PS > Remove-CIPPGroup -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -GroupID "98765432-1234-5678-9012-34567890ABCD" -Grouptype "Security" -DisplayName "Admins"
```

