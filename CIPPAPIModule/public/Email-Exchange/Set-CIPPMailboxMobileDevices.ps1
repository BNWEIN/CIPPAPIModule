<#
.SYNOPSIS
    Edits the mobile device settings for a specified user in a customer's tenant.

.DESCRIPTION
    The Set-CIPPMailboxMobileDevices function allows you to edit the mobile device settings for a specified user in a customer's tenant. 
    You can set the device ID, user ID, quarantine status, delete status, and device GUID.

.PARAMETER CustomerTenantID
    Specifies the ID of the customer's tenant.

.PARAMETER DeviceID
    Specifies the ID of the mobile device.

.PARAMETER UserID
    Specifies the ID of the user.

.PARAMETER Quarantine
    Specifies whether the mobile device should be quarantined. Valid values are "true" or "False".

.PARAMETER Delete
    Specifies whether the mobile device should be deleted. Valid values are "true" or "False". The default value is "False".

.PARAMETER DeviceGUID
    Specifies the GUID of the mobile device.

.EXAMPLE
    Set-CIPPMailboxMobileDevices -CustomerTenantID "contoso.onmicrosoft.com" -DeviceID "ABCD1234" -UserID "user1@domain.com" -Quarantine "true"

    This example sets the mobile device with the ID "ABCD1234" for the user "user1@domain.com" in the customer's tenant with the ID "contoso.onmicrosoft.com" to be quarantined.

.EXAMPLE
    Set-CIPPMailboxMobileDevices -CustomerTenantID "contoso.onmicrosoft.com" -UserID "user1@domain.com" -Delete "true" -DeviceGUID "EFGH5678"

    This example deletes the mobile device with the GUID "EFGH5678" for the user "user1@domain.com" in the customer's tenant with the ID "contoso.onmicrosoft.com".

#>
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
