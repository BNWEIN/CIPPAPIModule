Function Get-CIPPDomains {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting Domains for customer: $CustomerTenantID"
    
    # Define the endpoint and parameters
    $endpoint = "/api/ListDomains"
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    
    # Use the Invoke-CIPPRequest function to make the request
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}