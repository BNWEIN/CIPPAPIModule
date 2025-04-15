# Test-CIPPAPIModuleUpdate
## SYNOPSIS
Checks if there's a newer version of the CIPPAPIModule available on the PowerShell Gallery.
## DESCRIPTION
The Test-CIPPAPIModuleUpdate function compares the locally installed version of CIPPAPIModule 
with the latest version available on the PowerShell Gallery. It determines the local version 
by either reading the module manifest or querying the installed modules. If a newer version 
is found, it displays a warning message suggesting an update.
# PARAMETERS

#### EXAMPLE 1
```powershell
PS > Test-CIPPAPIModuleUpdate

Checks if the locally installed CIPPAPIModule is up to date.
```
 #### EXAMPLE 2
```powershell
PS > Test-CIPPAPIModuleUpdate -Verbose

Checks for updates with verbose output, showing the local and gallery versions.
```

