function Set-CIPPExchConnector {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory)]
        [ValidateSet("Enable", "Disabled")]
        [string]$State,
        [Parameter(Mandatory = $true)]
        [guid]$Guid,
        [Parameter(Mandatory = $true)]
        [string]$Type
    )


    Write-Verbose "Editing Exchange Connector for tenant $CustomerTenantID"
    $endpoint = "/api/editexconnector"
    $params = @{
        TenantFilter = $CustomerTenantID
        state = $State
        GUID = $Guid
        Type = $Type
    }
    
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

