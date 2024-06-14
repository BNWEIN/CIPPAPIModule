function Set-CIPPMailboxMobileDevices {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $false)]
            [string]$DeviceID,
            [Parameter(Mandatory = $true)]
            [string]$UserID,
            [Parameter(Mandatory = $false)]
            [ValidateSet("true", "False")]
            [string]$Quarantine,
            [Parameter(Mandatory = $false)]
            [ValidateSet("true", "False")]
            [string]$Delete = "False",
            [Parameter(Mandatory = $false)]
            [guid]$DeviceGUID
        )
    
    Write-Verbose "Editing Mobile Device for $UserID"
    $endpoint = "/api/execmailboxmobiledevices"
    if ($Quarantine) {
        $params = @{
            tenantfilter = $CustomerTenantID
            DeviceID = $DeviceID
            Userid = $UserID
            Quarantine = $Quarantine
        }
    } else {
        $params = @{
            tenantfilter = $CustomerTenantID
            Userid = $UserID
            Delete = $Delete
            GUID = $DeviceGUID
        }
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

