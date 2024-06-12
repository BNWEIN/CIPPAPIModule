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

