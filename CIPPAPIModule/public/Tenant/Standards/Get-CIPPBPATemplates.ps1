<#
.SYNOPSIS
Retrieves the CIPP BPA Templates.

.DESCRIPTION
The Get-CIPPBPATemplates function retrieves the CIPP (Continuous Improvement and Performance Program) BPA (Best Practice Assessment) Templates from the specified API endpoint.

.PARAMETER None
This function does not accept any parameters.

.EXAMPLE
Get-CIPPBPATemplates
Retrieves the CIPP BPA Templates.

#>

function Get-CIPPBPATemplates {
    [CmdletBinding()]
    Param()
    
    Write-Verbose 'Getting BPA Templates'
    $Endpoint = '/api/listbpatemplates'

    Invoke-CIPPRestMethod -Endpoint $Endpoint

}