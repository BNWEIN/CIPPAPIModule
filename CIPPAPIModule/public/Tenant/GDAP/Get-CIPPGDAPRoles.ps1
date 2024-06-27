<#
.SYNOPSIS
Retrieves the list of GDAP roles.

.DESCRIPTION
The Get-CIPPGDAPRoles function retrieves the list of GDAP (Granular delegated Admin Privileges ) roles by making a REST API call to the "/api/ListGDAPRoles" endpoint.

.PARAMETER None
This function does not accept any parameters.

.EXAMPLE
Get-CIPPGDAPRoles
Retrieves the list of GDAP roles.

#>

function Get-CIPPGDAPRoles {
    [CmdletBinding()]
    Param()

    Write-Verbose "Getting GDAP Role List"

    $endpoint = "/api/ListGDAPRoles"

    Invoke-CIPPRestMethod -Endpoint $endpoint
}
