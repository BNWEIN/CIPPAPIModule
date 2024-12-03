# Set-CIPPExtensionMappingHaloPSA
## SYNOPSIS
Sets the extension mapping for HaloPSA in the CIPP system.
## DESCRIPTION
The Set-CIPPExtensionMappingHaloPSA function sets the extension mapping for HaloPSA by adding or updating the mapping for a specified tenant. It retrieves the current extension mappings, updates them with the provided Halo client information, and sends the updated mappings to the CIPP system via a REST API call.
# PARAMETERS

## **-HaloClientID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the Halo client. This parameter is mandatory.

  ## **-HaloClientName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The name of the Halo client. This parameter is mandatory.

  ## **-TenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the tenant for which the extension mapping is being set. This parameter is mandatory.

 #### EXAMPLE 1
```powershell
PS > Set-CIPPExtensionMappingHaloPSA -HaloClientID "12345" -HaloClientName "ExampleClient" -TenantID "7174f39b-33c6-4226-a67b-67fc1f127ef5"
```

