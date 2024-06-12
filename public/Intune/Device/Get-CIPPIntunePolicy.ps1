Function Get-CIPPIntunePolicy {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [string]$PolicyID,
        [Parameter(Mandatory = $false)]
        [string]$Urlname
    )

    Write-Verbose "Getting Intune policies for customer: $CustomerTenantID"

    # Validation to ensure both $PolicyID and $urlname are supplied together
    if (($PolicyID -and -not $urlname) -or (-not $PolicyID -and $urlname)) {
        throw "You must supply both -PolicyID and -Urlname parameters together or not at all."
    }
    
    # Define the endpoint and parameters
    $endpoint = "/api/listintunepolicy"
    $params = @{
        tenantfilter = $CustomerTenantID
        URLName = $urlname
        id = $PolicyID
    }
    
    # Use the Invoke-CIPPRequest function to make the request
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}