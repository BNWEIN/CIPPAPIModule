function Get-CIPPUsers {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $false)]
            [string]$UserID
        )
    
    if (-not $UserID) {
        Write-Verbose "Getting all users for tenant $CustomerTenantID"
    } else {
        Write-Verbose "Getting user details for user $UserID"
    }
    $endpoint = "/api/Listusers"
    $params = @{
        tenantfilter = $CustomerTenantID
        userId = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

