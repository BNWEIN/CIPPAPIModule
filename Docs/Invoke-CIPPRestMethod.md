# Invoke-CIPPRestMethod
## SYNOPSIS
Invokes a REST method using the CIPP API.
## DESCRIPTION
The Invoke-CIPPRestMethod function is used to send HTTP requests to the CIPP API. It supports various HTTP methods such as GET, POST, PUT, DELETE, etc. The function assembles the request parameters, including the endpoint, query parameters, request body, headers, and authorization token. It then sends the request using the Invoke-RestMethod cmdlet and returns the response.
# PARAMETERS

## **-Endpoint**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The endpoint of the API to send the request to.

  ## **-Params**
> ![Foo](https://img.shields.io/badge/Type-Hashtable-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-@{}-Blue?color=5547a8)\
Optional. A hashtable of query parameters to include in the request URL.

  ## **-Method**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-GET-Blue?color=5547a8)\
Optional. The HTTP method to use for the request. The default value is 'GET'.

  ## **-Body**
> ![Foo](https://img.shields.io/badge/Type-Hashtable-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-@{}-Blue?color=5547a8)\
Optional. A hashtable representing the request body. It will be converted to JSON before sending the request.

  ## **-ContentType**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-application/json-Blue?color=5547a8)\
Optional. The content type of the request body. The default value is 'application/json'.

  ## **-Authorization**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Optional. The authorization token to include in the request headers.

 #### EXAMPLE 1
```powershell
PS > Invoke-CIPPRestMethod -Endpoint '/api/Listusers' -Method 'GET' -Params @{ 'tenantFilter' = '11c11ab1-527a-1d29-l92e-76413h012s76' }
```
 #### EXAMPLE 2
```powershell
PS > Invoke-CIPPRestMethod -Endpoint '/api/ListMailboxPermissions' -Params @{ 'tenantFilter' = 'M365x72601982.onmicrosoft.com', 'userid' = '11c11ab1-527a-1d29-l92e-76413h012s76'}
```
 #### EXAMPLE 3
```powershell
PS > Invoke-CIPPRestMethod -Endpoint '/api/adduser' -method 'POST' -Body @{ 'tenantFilter' = '11c11ab1-527a-1d29-l92e-76413h012s76';'DisplayName' = 'Test User';'UserName' = 'testuser';'AutoPassword' = $true;'FirstName' = 'Test';'LastName' = 'User';'Domain' = 'M365x72601982.onmicrosoft.com';'CopyFrom' = "" }
```

