function Get-CIPPDefenderState {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [Guid]$CustomerTenantID
        )
    
    Write-Verbose "Getting Defender State for customer: $CustomerTenantID"
    $endpoint = "/api/listdefenderstate"
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params

}