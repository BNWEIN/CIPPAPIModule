function Add-CIPPContact {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$DisplayName,
            [Parameter(Mandatory = $true)]
            [string]$ExternalEmailAddress,
            [Parameter(Mandatory = $true)]
            [string]$FirstName,
            [Parameter(Mandatory = $true)]
            [string]$LastName

        )

    Write-Verbose "Adding Contact in tenant: $CustomerTenantID"
    $Endpoint = "/api/addcontact"
    $body = @{
        tenantid        = $CustomerTenantID
        displayName     = $DisplayName
        email           = $ExternalEmailAddress
        FirstName       = $FirstName
        LastName        = $LastName
    }
    Invoke-CIPPRestMethod -Endpoint $Endpoint -Body $body -Method POST
}
