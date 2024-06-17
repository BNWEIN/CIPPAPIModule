# Get-CIPPPhishPolicies
## SYNOPSIS
Retrieves the phishing policies for a specific customer tenant.
## DESCRIPTION
The Get-CIPPPhishPolicies function retrieves the phishing policies for a specific customer tenant by making a REST API call to the "/api/listphishpolicies" endpoint.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant for which to retrieve the phishing policies.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPPhishPolicies -CustomerTenantID "contoso.onmicrosoft.com"
```

