# Send-CIPPPush
## SYNOPSIS
Sends a push notification to a user.
## DESCRIPTION
The Send-CIPPPush function sends a push notification to a user specified by their email address.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer's tenant.

  ## **-UserEmail**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The email address of the user to send the push notification to.

 #### EXAMPLE 1
```powershell
PS > Send-CIPPPush -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserEmail "user@example.com"
```

