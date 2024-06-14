function Get-CIPPIncidentList {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID
        )
    
    Write-Verbose "Getting Incidents for customer: $CustomerTenantID"
    $endpoint = "/api/execincidentslist"
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

