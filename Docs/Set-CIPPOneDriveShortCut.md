# Set-CIPPOneDriveShortCut
## SYNOPSIS
Creates a OneDrive shortcut for a user to a specified SharePoint URL.
## DESCRIPTION
The Set-CIPPOneDriveShortCut function creates a OneDrive shortcut for a specified user to a specified SharePoint URL. It uses the Invoke-CIPPRestMethod function to make a POST request to the "/api/execonedriveshortcut" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The default domain of the customer's tenant.

  ## **-Username**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The username of the user for whom the OneDrive shortcut is being created.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The UserID of the user for whom the OneDrive shortcut is being created.

  ## **-SharePointURL**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The URL of the SharePoint site to which the OneDrive shortcut will point.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPOneDriveShortCut -CustomerTenantID "contoso.onmicrosoft.com" -Username "john.doe@contoso.onmicrosoft.com" -UserID "98765432-1234-5678-9012-34567890abcd" -SharePointURL "https://contoso.sharepoint.com/sites/finance"

This example creates a OneDrive shortcut for the user "john.doe@contoso.onmicrosoft.com" to the SharePoint site located at "https://contoso.sharepoint.com/sites/finance" in the customer's tenant with the ID "contoso.onmicrosoft.com".
```

