Function Get-CIPPLocalAdminPassword {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [guid]$guid
    )

    Write-Verbose "Getting local admin password for computer: $guid"
    
    # Define the endpoint and parameters
    $endpoint = "/api/execgetlocaladminpassword"
    $params = @{
        tenantfilter    = $CustomerTenantID
        guid            = $guid 
    }
    
    # Use the Invoke-CIPPRequest function to make the request
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}