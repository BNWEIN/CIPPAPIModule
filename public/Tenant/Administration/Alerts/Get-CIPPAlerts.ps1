function Get-CIPPAlerts {
    [CmdletBinding()]
    param ()
    
    Write-Verbose "Getting CIPP Alerts"

    # Define the endpoint and parameters
    $endpoint = "/api/getcippalerts"

    Invoke-CIPPRestMethod -Endpoint $endpoint
}

