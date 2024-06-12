function Get-CIPPBPA {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $false)]
            [string]$ReportName
        )
    
    Write-Verbose "Getting BPA Report for customer: $CustomerTenantID"
    $Endpoint = "/api/listbpa"
    $Params = @{
        tenantfilter = $CustomerTenantID
        Report = $ReportName
    }
    
    Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params
}