# Get-CIPPADConnectStatus
## SYNOPSIS
Retrieves the AD Connect status, AD Connect settings, or AD objects in error for a specified customer tenant.
## DESCRIPTION
The Get-CIPPADConnectStatus function retrieves information about the AD Connect status, AD Connect settings, or AD objects in error for a specified customer tenant. It makes a REST API call to retrieve the data from the CIPP API.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant for which the AD Connect information is to be retrieved.

  ## **-dataToReturn**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the type of data to be returned. Valid values are "AzureADConnectSettings" to retrieve AD Connect settings, "AzureADObjectsInError" to retrieve AD objects in error, or leave empty to retrieve the AD Connect status.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPADConnectStatus -CustomerTenantID "contoso.onmicrosoft.com" -dataToReturn "AzureADConnectSettings"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPADConnectStatus -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -dataToReturn "AzureADConnectSettings"
```
 #### EXAMPLE 3
```powershell
PS > Get-CIPPADConnectStatus -CustomerTenantID "contoso.onmicrosoft.com" -dataToReturn "AzureADObjectsInError"
```
 #### EXAMPLE 4
```powershell
PS > Get-CIPPADConnectStatus -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -dataToReturn "AzureADObjectsInError"
```
 #### EXAMPLE 5
```powershell
PS > Get-CIPPADConnectStatus -CustomerTenantID "contoso.onmicrosoft.com"
```
 #### EXAMPLE 6
```powershell
PS > Get-CIPPADConnectStatus -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

