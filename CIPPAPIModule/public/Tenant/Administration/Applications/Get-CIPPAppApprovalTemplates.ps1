<#
.SYNOPSIS
Gets application approval templates from the CIPP API.

.DESCRIPTION
The Get-CIPPAppApprovalTemplates function retrieves a list of application approval templates from the CIPP API.

.EXAMPLE
Get-CIPPAppApprovalTemplates
Returns all application approval templates.

#>
function Get-CIPPAppApprovalTemplates {
    [CmdletBinding()]
    Param()

    Write-Verbose 'Retrieving application approval templates'
    $endpoint = '/api/ListAppApprovalTemplates'
    
    Invoke-CIPPRestMethod -Endpoint $endpoint -Method GET
}
