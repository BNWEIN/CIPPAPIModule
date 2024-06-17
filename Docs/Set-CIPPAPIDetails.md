# Set-CIPPAPIDetails
## SYNOPSIS
Sets the CIPP API details.
## DESCRIPTION
The Set-CIPPAPIDetails function is used to set the CIPP API details, including the client ID, client secret, API URL, and tenant ID.
# PARAMETERS

## **-CIPPClientID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the client ID for the CIPP API.

  ## **-CIPPClientSecret**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the client secret for the CIPP API.

  ## **-CIPPAPIUrl**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the URL for the CIPP API.

  ## **-TenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the tenant ID for the CIPP API.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPAPIDetails -CIPPClientID "d8d41058-97df-4b80-8e1b-7083d756409f" -CIPPClientSecret "YourSecurePassword" -CIPPAPIUrl "https://api.cipp.com" -TenantID "7c2f78c0-554e-4f42-a663-c4df3ce7f51f"

This example sets the CIPP API details with the specified values.
```

