# Remove-CIPPConnectionFilterTemplate
## SYNOPSIS
Removes a Connection Filter Template.
## DESCRIPTION
The Remove-CIPPConnectionFilterTemplate function removes a specified Connection Filter Template from CIPP.
# PARAMETERS

## **-TemplateId**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the Connection Filter Template to remove.

 #### EXAMPLE 1
```powershell
PS > Remove-CIPPConnectionFilterTemplate -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -TemplateId "98765432-4321-4321-4321-BA0987654321"
```

