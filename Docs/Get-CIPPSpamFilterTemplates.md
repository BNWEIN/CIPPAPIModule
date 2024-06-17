# Get-CIPPSpamFilterTemplates
## SYNOPSIS
Retrieves spam filter templates from the CIPP API.
## DESCRIPTION
The Get-CIPPSpamFilterTemplates function retrieves spam filter templates from the CIPP API. It makes a REST API call to the "/api/listspamfiltertemplates" endpoint and returns the templates.
# PARAMETERS

## **-TemplateID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Specifies the ID of the template to retrieve. This parameter is optional.

 #### EXAMPLE 1
```powershell
PS > Get-CIPPSpamFilterTemplates -TemplateID "12345"
```

