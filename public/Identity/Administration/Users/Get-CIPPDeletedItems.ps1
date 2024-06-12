function Get-CIPPDeletedItems {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID
        )
    
        Write-Verbose "Getting deleted items for $CustomerTenantID"
    
        $endpoint = "/api/listdeleteditems"
        $params = @{
        tenantfilter = $CustomerTenantID
        userId = $UserID
    }
    
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

