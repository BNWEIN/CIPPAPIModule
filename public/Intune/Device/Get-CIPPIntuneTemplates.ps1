function Get-CIPPIntuneTemplates {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $false)]
            [string]$TemplateID
        )
    
    Write-Verbose "Getting Intune Templates"
    $endpoint = "/api/listintunetemplates"
    $params = @{
        tenantfilter = $CustomerTenantID
        id = $TemplateID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}