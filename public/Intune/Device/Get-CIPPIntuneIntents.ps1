Function Get-CIPPIntuneIntents {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID
    )

    Write-Verbose "Getting Intune Intents customer: $CustomerTenantID"
    
    # Define the endpoint and parameters
    $endpoint = "/api/listintuneintents"
    $params = @{
        tenantfilter = $CustomerTenantID
    }
    
    # Use the Invoke-CIPPRequest function to make the request
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}