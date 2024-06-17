<#
.SYNOPSIS
Retrieves Conditional Access Templates.

.DESCRIPTION
The Get-CIPPCATemplates function retrieves the list of Conditional Access Templates from the specified endpoint.

.PARAMETER None
This function does not accept any parameters.

.EXAMPLE
Get-CIPPCATemplates
Retrieves the list of Conditional Access Templates.

#>

function Get-CIPPCATemplates {
    [CmdletBinding()]
    Param()
    Write-Verbose "Getting Conditional Access Templates"
    $endpoint = "/api/listcatemplates"
    
    Invoke-CIPPRestMethod -Endpoint $endpoint
    
}
