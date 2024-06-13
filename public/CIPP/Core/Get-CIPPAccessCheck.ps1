function Get-CIPPAccessCheck {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string[]]$CustomerTenantID
        )

    Write-Verbose "Running tenant access check for $CustomerTenantID"
    $Endpoint = "/api/execaccesschecks"

    $params = @{
        tenants = "true"
    }
    $body = @{
        tenantid        = $CustomerTenantID
    }
    Invoke-CIPPRestMethod -Endpoint $Endpoint -Body $body -Params $params -Method POST
}
