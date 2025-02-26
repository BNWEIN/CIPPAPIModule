# Remove-CIPPStandardTemplate
## SYNOPSIS
Removes a standards template.
## DESCRIPTION
The Remove-CIPPStandardTemplate function removes a specified standards template from CIPP.
# PARAMETERS

## **-TemplateId**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the standards template to remove.

 #### EXAMPLE 1
```powershell
PS > Remove-CIPPStandardTemplate -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -TemplateId "98765432-4321-4321-4321-BA0987654321"
```

