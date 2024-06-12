function Set-CIPPQuarantineManagement {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$ID,
            [Parameter(Mandatory = $false)]
            [ValidateSet(
                'true',
                'false'
            )]
            [string]$AllowSender,
            [Parameter(Mandatory = $true)]
            [ValidateSet(
                'Deny',
                'Release,
                ')]
            [string]$Type

        )
    
    Write-Verbose "Managing Quarentine for $CustomerTenantID"
    $endpoint = "/api/execquarantinemanagement"
    $params = @{
        tenantfilter = $CustomerTenantID
        id = $ID
        allowSender = $AllowSender
        type = $Type
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}