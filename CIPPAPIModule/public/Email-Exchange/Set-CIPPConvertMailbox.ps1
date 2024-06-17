<#
.SYNOPSIS
Converts a mailbox to a shared mailbox or user mailbox in the CIPP system.

.DESCRIPTION
The Set-CIPPConvertMailbox function is used to convert a mailbox in the CIPP system to either a shared mailbox or a user mailbox. It sends a request to the CIPP API to perform the conversion.

.PARAMETER CustomerTenantID
The ID of the customer tenant where the mailbox belongs.

.PARAMETER UserID
The ID of the user whose mailbox needs to be converted.

.PARAMETER ConvertToUserMailbox
Specifies whether the mailbox should be converted to a user mailbox. If this switch is provided, the mailbox will be converted to a user mailbox. If not provided, the mailbox will be converted to a shared mailbox.

.EXAMPLE
Set-CIPPConvertMailbox -CustomerTenantID "contoso.onmicrosoft.com" -UserID "user@domain.com" -ConvertToUserMailbox
Converts the mailbox of user "user1" in the customer tenant "contoso.onmicrosoft.com" to a user mailbox.

.EXAMPLE
Set-CIPPConvertMailbox -CustomerTenantID "contoso.onmicrosoft.com" -UserID "user@domain.com"
Converts the mailbox of user "user@domain.com" in the customer tenant "contoso.onmicrosoft.com" to a shared mailbox.

#>
function Set-CIPPConvertMailbox {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID,
        [Parameter(Mandatory = $false)]
        [switch]$ConvertToUserMailbox
    )
    
    Write-Verbose "Converting Mailbox $userID"
    
    $endpoint = "/api/execconverttosharedmailbox"
    $params = @{
        tenantfilter = $CustomerTenantID
        id = $UserID
        ConvertToUser = if ($ConvertToUserMailbox) { "true" } else { "false" }
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
