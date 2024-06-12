function Get-CIPPExchangeConnectorTemplates {
    [CmdletBinding()]
        Param()

    Write-Verbose "Getting Exchange Connectors Templates"
    $endpoint = "/api/listexconnectortemplates"
    
    Invoke-CIPPRestMethod -Endpoint $endpoint
}

