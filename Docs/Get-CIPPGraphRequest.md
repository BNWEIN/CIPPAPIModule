# Get-CIPPGraphRequest
## SYNOPSIS
Retrieves graph data from a specified endpoint for a given tenant.
## DESCRIPTION
The Get-CIPPGraphRequest function queries a specified Graph endpoint for a specific tenant and retrieves the graph data. It supports various optional parameters for customization.
# PARAMETERS

## **-CustomerTenantId**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant for which the graph data is requested. This parameter is mandatory.

  ## **-GraphEndPoint**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the endpoint URL of the Graph API. This parameter is mandatory.

  ## **-count**
> ![Foo](https://img.shields.io/badge/Type-Boolean-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to include the count of items in the response. This parameter is optional.

  ## **-Select**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the properties to include in the response. This parameter is optional.

  ## **-DisablePagination**
> ![Foo](https://img.shields.io/badge/Type-Boolean-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether to disable pagination in the response. This parameter is optional.

  ## **-Top**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the maximum number of items to include in the response. This parameter is optional.

  ## **-Format**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the format of the response. This parameter is optional.

  ## **-Filter**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the filter to apply to the response. This parameter is optional.

  ## **-Expand**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the properties to expand in the response. This parameter is optional.

  ## **-Search**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the search query to apply to the response. This parameter is optional.

  ## **-ReverseTenantLookupProperty**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the property to use for reverse tenant lookup. This parameter is optional.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPGraphRequest -CustomerTenantId "contoso.onmicrosoft.com" -GraphEndPoint "users" -Select "displayName,mail" -DisablePagination $true -Top 10

Retrieves graph data from the specified endpoint for the tenant with ID "contoso.onmicrosoft.com". The response includes only the "displayName" and "mail" properties, disables pagination, and includes a maximum of 10 items in the response.
```

