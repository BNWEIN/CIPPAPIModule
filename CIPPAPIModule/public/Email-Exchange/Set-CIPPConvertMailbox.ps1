<#
.SYNOPSIS
Converts a mailbox to a different type in the CIPP system.

.DESCRIPTION
The Set-CIPPConvertMailbox function converts a mailbox to one of the following types:
- Shared mailbox
- Regular user mailbox
- Room mailbox
- Equipment mailbox
It sends a request to the CIPP API to perform the conversion.

.PARAMETER CustomerTenantID
The ID of the customer tenant where the mailbox belongs.

.PARAMETER UserID
The ID of the user whose mailbox needs to be converted.

.PARAMETER Username
Optional. The username associated with the mailbox.

.PARAMETER MailboxType
The type to convert the mailbox to. Valid values are:
- Shared: Convert to shared mailbox
- Regular: Convert to regular user mailbox
- Room: Convert to room mailbox
- Equipment: Convert to equipment mailbox

.EXAMPLE
Set-CIPPConvertMailbox -CustomerTenantID "contoso.onmicrosoft.com" -UserID "user@domain.com" -MailboxType "Shared"
Converts the specified mailbox to a shared mailbox.

.EXAMPLE
Set-CIPPConvertMailbox -CustomerTenantID "contoso.onmicrosoft.com" -UserID "user@domain.com" -MailboxType "Regular"
Converts the specified mailbox to a regular user mailbox.

.EXAMPLE
Set-CIPPConvertMailbox -CustomerTenantID "contoso.onmicrosoft.com" -UserID "room@domain.com" -MailboxType "Room"
Converts the specified mailbox to a room mailbox.
#>
function Set-CIPPConvertMailbox {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID,
        [Parameter(Mandatory = $false)]
        [string]$Username,
        [Parameter(Mandatory = $true)]
        [ValidateSet('Shared', 'Regular', 'Room', 'Equipment')][string]$MailboxType
    )
    
    Write-Verbose "Converting Mailbox $UserID to $MailboxType"
    
    $endpoint = '/api/ExecConvertMailbox'
    $params = @{
        tenantFilter = $CustomerTenantID
        id           = $UserID
        MailboxType  = $MailboxType
        Username     = $Username
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method 'POST'
}
