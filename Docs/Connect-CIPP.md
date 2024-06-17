# Connect-CIPP
## SYNOPSIS
Connects to the CIPP API using the provided credentials.
## DESCRIPTION
The Connect-CIPP function establishes a connection to the CIPP API by obtaining an access token using the client credentials flow. It requires the CIPP API URL, client ID, client secret, and tenant ID as input parameters.
# PARAMETERS

## **-CIPPAPIUrl**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The URL of the CIPP API.

  ## **-CIPPClientID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The client ID used to authenticate with the CIPP API.

  ## **-CIPPClientSecret**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The client secret used to authenticate with the CIPP API.

  ## **-TenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The ID of the tenant associated with the CIPP API.

 #### EXAMPLE 1
```powershell
PS > Connect-CIPP -CIPPAPIUrl "https://api.cipp.com" -CIPPClientID "12345678-1234-1234-1234-1234567890ab" -CIPPClientSecret "MyClientSecret" -TenantID "98765432-4321-4321-4321-0987654321ba"
```

