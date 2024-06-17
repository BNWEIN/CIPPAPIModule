# Get-CIPPMessageTrace
## SYNOPSIS
Retrieves the message trace for a specific customer tenant ID.
## DESCRIPTION
The Get-CIPPMessageTrace function retrieves the message trace for a specific customer tenant ID within a specified number of days. 
It can also filter the results based on the sender and recipient email addresses.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the customer tenant ID for which the message trace needs to be retrieved. This parameter is mandatory.

  ## **-Days**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the number of days within which the message trace needs to be retrieved. This parameter is mandatory.

  ## **-Sender**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the sender email address to filter the message trace results. This parameter is optional.

  ## **-Recipient**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the recipient email address to filter the message trace results. This parameter is optional.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPMessageTrace -CustomerTenantID "contoso.onmicrosoft.com" -Days 7
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPMessageTrace -CustomerTenantID "contoso.onmicrosoft.com" -Days 30 -Sender "john.doe@contoso.com"
```
 #### EXAMPLE 3
```powershell
PS > Get-CIPPMessageTrace -CustomerTenantID "contoso.onmicrosoft.com" -Days 14 -Recipient "jane.smith@contoso.com"
```

