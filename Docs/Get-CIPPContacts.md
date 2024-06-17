# Get-CIPPContacts
## SYNOPSIS
Retrieves contact details for a specific contact or all contacts for a given tenant.
## DESCRIPTION
The Get-CIPPContacts function retrieves contact details for a specific contact or all contacts for a given tenant in the CIPP system. It makes use of the Invoke-CIPPRestMethod function to send a request to the CIPP API.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant for which to retrieve the contacts. This parameter is mandatory.

  ## **-ContactID**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the ID of the contact to retrieve details for. If not provided, details for all contacts in the specified tenant will be retrieved. This parameter is optional.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPContacts -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -ContactID "65be49bb-85cb-4d92-9e34-9e855d0c830c"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPContacts -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
```

