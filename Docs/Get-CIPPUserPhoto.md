# Get-CIPPUserPhoto
## SYNOPSIS
Retrieves the photo of a user from the CIPP API.
## DESCRIPTION
The Get-CIPPUserPhoto function is used to retrieve the photo of a user from the CIPP API. It sends a request to the API endpoint "/api/listuserphoto" with the specified customer tenant ID and user ID.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The customer tenant ID associated with the user.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user whose photo needs to be retrieved.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPUserPhoto -CustomerTenantID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc" -UserID "user@domain.com"

This example retrieves the photo of the user with the ID "user@domain.com" from the customer tenant with the ID "281ceb6e-3d12-4a7f-b571-3c4f35ad85bc".
```

