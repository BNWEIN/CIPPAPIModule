# Get-CIPPExtensionMapping
## SYNOPSIS
Retrieves the extension mapping for a specified extension name.
## DESCRIPTION
The Get-CIPPExtensionMapping function calls an API endpoint to get the extension mapping for a given extension name.
The function supports the following extension names: "HaloPSA", "NinjaOne", "NinjaOneFields", "Hudu", and "HuduFields".
# PARAMETERS

## **-ExtensionName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The name of the extension for which to retrieve the mapping. This parameter is mandatory and accepts the following values: "HaloPSA", "NinjaOne", "NinjaOneFields", "Hudu", "HuduFields".

 #### EXAMPLE 1
```powershell
PS C:\>Get-CIPPExtensionMapping -ExtensionName "HaloPSA"
```

