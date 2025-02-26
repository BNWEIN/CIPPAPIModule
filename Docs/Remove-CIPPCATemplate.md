# Remove-CIPPCATemplate
## SYNOPSIS
Removes a Conditional Access template.
## DESCRIPTION
The Remove-CIPPCATemplate function removes a specified Conditional Access template from CIPP.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

  ## **-TemplateId**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the Conditional Access template to remove.

 #### EXAMPLE 1
```powershell
PS > Remove-CIPPCATemplate -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -TemplateId "98765432-4321-4321-4321-BA0987654321"
```

