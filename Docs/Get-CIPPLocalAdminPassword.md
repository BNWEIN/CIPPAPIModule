# Get-CIPPLocalAdminPassword
## SYNOPSIS
Retrieves the local admin password for a specified computer.
## DESCRIPTION
The Get-CIPPLocalAdminPassword function retrieves the local admin password for a specified computer in the CIPP project. It makes a REST API request to the CIPP API endpoint to fetch the password.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant.

  ## **-GUID**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The GUID of the computer for which to retrieve the local admin password.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPLocalAdminPassword -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -guid "abcdefg"
```

