# Set-CIPPMailboxEmailSize
## SYNOPSIS
Sets the maximum email send and receive size for a mailbox.
## DESCRIPTION
The Set-CIPPMailboxEmailSize function configures the maximum email message size limits for sending and receiving messages for a specified mailbox in the customer's tenant. This allows you to control the size of emails that a user can send or receive, overriding tenant-wide defaults.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the customer tenant ID. This parameter is mandatory.

  ## **-UserPrincipalName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the User Principal Name of the mailbox owner. Either UserPrincipalName or UserId must be specified.

  ## **-UserId**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the unique identifier of the mailbox. Either UserPrincipalName or UserId must be specified.

  ## **-MaxSendSize**
> ![Foo](https://img.shields.io/badge/Type-Int32-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) ![Foo](https://img.shields.io/badge/DefaultValue-0-Blue?color=5547a8)\
Specifies the maximum size in megabytes (MB) of messages that can be sent from this mailbox. Valid range is 1 to 150 MB. Either MaxSendSize or MaxReceiveSize must be specified.

  ## **-MaxReceiveSize**
> ![Foo](https://img.shields.io/badge/Type-Int32-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) ![Foo](https://img.shields.io/badge/DefaultValue-0-Blue?color=5547a8)\
Specifies the maximum size in megabytes (MB) of messages that can be received by this mailbox. Valid range is 1 to 150 MB. Either MaxSendSize or MaxReceiveSize must be specified.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPMailboxEmailSize -CustomerTenantID "contoso.onmicrosoft.com" -UserPrincipalName "john.doe@contoso.com" -MaxSendSize 25 -MaxReceiveSize 36

Sets the maximum send size to 25 MB and maximum receive size to 36 MB for john.doe@contoso.com's mailbox.
```
 #### EXAMPLE 2
```powershell
PS > Set-CIPPMailboxEmailSize -CustomerTenantID "contoso.onmicrosoft.com" -UserPrincipalName "jane.smith@contoso.com" -MaxSendSize 50

Sets only the maximum send size to 50 MB for jane.smith@contoso.com's mailbox, leaving the receive size at the default.
```
 #### EXAMPLE 3
```powershell
PS > Set-CIPPMailboxEmailSize -CustomerTenantID "contoso.onmicrosoft.com" -UserPrincipalName "admin@contoso.com" -MaxReceiveSize 100

Sets only the maximum receive size to 100 MB for admin@contoso.com's mailbox.
```
 #### EXAMPLE 4
```powershell
PS > Set-CIPPMailboxEmailSize -CustomerTenantID "contoso.onmicrosoft.com" -UserId "11111111-1111-1111-1111-111111111111" -MaxSendSize 75 -MaxReceiveSize 100

Sets both send and receive size limits using the UserId instead of UserPrincipalName.
```

