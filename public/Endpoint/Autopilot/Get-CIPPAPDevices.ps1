function Get-CIPPAPDevices {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID
        )

    Write-Verbose "Getting AutoPilot Devices for $CustomerTenantID"
    $Endpoint = "/api/listapdevices"
    $Params = @{
        tenantfilter = $CustomerTenantID
    }
    
    Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params

}