function Get-CIPPAppConsentReqs {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID
        )
    
    Write-Verbose "Getting app consent requests for customer: $CustomerTenantID"
    $Endpoint = "/api/listappconsentrequests"
    $Params = @{
        tenantfilter = $CustomerTenantID
    }
    
    Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params

}