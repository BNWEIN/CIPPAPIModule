function Get-CIPPCAPolicies {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID
        )
    
    Write-Verbose "Getting Conditional Access Policies for customer: $CustomerTenantID"
    $Endpoint = "/api/listconditionalaccesspolicies"
    $Params = @{
        tenantfilter = $CustomerTenantID
    }
    
    Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params

}