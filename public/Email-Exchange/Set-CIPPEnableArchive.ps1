function Set-CIPPEnableArchive {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$UserID
        )
    
    
    Write-Verbose "Enabling Email Archive for $userID"
    
    $endpoint = "/api/execenablearchive"
    $params = @{
        tenantfilter = $CustomerTenantID
        id = $UserID
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}