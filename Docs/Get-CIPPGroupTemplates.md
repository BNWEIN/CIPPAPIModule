# Get-CIPPGroupTemplates
## SYNOPSIS
Retrieves group templates from the CIPP API.
## DESCRIPTION
The Get-CIPPGroupTemplates function retrieves group templates from the CIPP API. It can retrieve all group templates or a specific template based on the provided TemplateID.
# PARAMETERS

## **-TemplateID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the ID of the group template to retrieve. If not provided, all group templates will be retrieved.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPGroupTemplates -TemplateID "12345"
```
 #### EXAMPLE 2
```powershell
PS > Get-CIPPGroupTemplates
```

