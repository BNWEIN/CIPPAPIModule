function Set-CIPPMEMPolicy {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$ID,
            [Parameter(Mandatory = $false)]
            [string]$DisplayName,
            [Parameter(Mandatory = $false)]
            [string]$Description,
            [ValidateSet("allLicensedUsers", "AllDevices", "AllDevicesAndUsers")]
            [string]$AssignTo
        )
    
    Write-Verbose "Getting app consent requests for customer: $CustomerTenantID"
    $Endpoint = "/api/editpolicy"

    $body = @{
        Tenant = $CustomerTenantID
        ID = $ID
        displayname = $DisplayName
        description = $Description
    }
    
    Invoke-CIPPRestMethod -Endpoint $Endpoint -Body $body -Method 'POST'

}