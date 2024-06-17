<#
.SYNOPSIS
Retrieves the mobile devices associated with a mailbox.

.DESCRIPTION
The Get-CIPPMailboxMobileDevices function retrieves the mobile devices associated with a mailbox in the CIPP system. It makes use of the Invoke-CIPPRestMethod function to send a request to the CIPP API and retrieve the mobile devices.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant.

.PARAMETER Mailbox
Specifies the mailbox for which to retrieve the mobile devices.

.EXAMPLE
Get-CIPPMailboxMobileDevices -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -Mailbox "user@example.com"
Retrieves the mobile devices associated with the mailbox "user@example.com" in the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>
function Get-CIPPMailboxMobileDevices {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$Mailbox
    )

    Write-Verbose "Getting mailbox mobile devices for $Mailbox"
    $endpoint = "/api/listmailboxmobiledevices"
    $params = @{
        tenantfilter = $CustomerTenantID
        mailbox = $Mailbox
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
