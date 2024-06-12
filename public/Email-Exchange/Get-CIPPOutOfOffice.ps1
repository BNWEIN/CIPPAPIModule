function Get-CIPPOutOfOffice {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$UserID
        )
    
    Write-Verbose "Getting out of office for $UserID"
    $endpoint = "/api/listooo"
    $params = @{
        tenantfilter = $CustomerTenantID
        userid = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

