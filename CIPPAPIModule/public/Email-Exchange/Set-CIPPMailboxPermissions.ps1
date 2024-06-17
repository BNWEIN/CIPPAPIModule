<#
.SYNOPSIS
Sets mailbox permissions for a user in the CIPP system.

.DESCRIPTION
The Set-CIPPMailboxPermissions function is used to edit mailbox permissions for a specified user in the CIPP system. It allows you to add or remove full access, send as, and send on behalf permissions for the user's mailbox.

.PARAMETER CustomerTenantID
The ID of the customer's tenant in the CIPP system.

.PARAMETER Userid
The ID of the user whose mailbox permissions need to be edited.

.PARAMETER RemoveFullAccess
An optional array of mailboxes from which to remove full access permissions for the user.

.PARAMETER AddFullAccessAutoMap
An optional array of mailboxes to which to add full access permissions with automapping enabled for the user.

.PARAMETER AddFullAccessNoAutoMap
An optional array of mailboxes to which to add full access permissions with automapping disabled for the user.

.PARAMETER AddSendAs
An optional array of mailboxes to which to add send as permissions for the user.

.PARAMETER RemoveSendAs
An optional array of mailboxes from which to remove send as permissions for the user.

.PARAMETER AddSendOnBehalf
An optional array of mailboxes to which to add send on behalf permissions for the user.

.PARAMETER RemoveSendOnBehalf
An optional array of mailboxes from which to remove send on behalf permissions for the user.

.EXAMPLE
Set-CIPPMailboxPermissions -CustomerTenantID "contoso.onmicrosoft.com" -Userid "john.doe@example.com" -AddFullAccessAutoMap "mailbox1@example.com", "mailbox2@example.com" -AddSendAs "mailbox3@example.com"

This example sets mailbox permissions for the user "john.doe@example.com" in the CIPP system. It adds full access permissions with automapping enabled to "mailbox1@example.com" and "mailbox2@example.com", and adds send as permissions to "mailbox3@example.com".

#>

function Set-CIPPMailboxPermissions {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$Userid,
        [Parameter(Mandatory = $false)]
        [array]$RemoveFullAccess = @(),
        [Parameter(Mandatory = $false)]
        [array]$AddFullAccessAutoMap = @(),
        [Parameter(Mandatory = $false)]
        [array]$AddFullAccessNoAutoMap = @(),
        [Parameter(Mandatory = $false)]
        [array]$AddSendAs = @(),
        [Parameter(Mandatory = $false)]
        [array]$RemoveSendAs = @(),
        [Parameter(Mandatory = $false)]
        [array]$AddSendOnBehalf = @(),
        [Parameter(Mandatory = $false)]
        [array]$RemoveSendOnBehalf = @()
    )

    function ConvertTo-FormattedArray {
        param (
            [array]$inputArray,
            [string]$labelPrefix
        )
        $formattedArray = @()
        foreach ($item in $inputArray) {
            $formattedArray += @{
                value = $item
                label = "$labelPrefix - $item"
            }
        }
        return $formattedArray
    }

    Write-Verbose "Editing Mailbox permissions for $Userid"

    $endpoint = "/api/execeditmailboxpermissions"
    $body = @{
        TenantFilter = $CustomerTenantID
        UserID = $Userid
        RemoveFullAccess = (ConvertTo-FormattedArray -inputArray $RemoveFullAccess -labelPrefix "Remove Full Access")
        AddFullAccess = (ConvertTo-FormattedArray -inputArray $AddFullAccessAutoMap -labelPrefix "Add Full Access AutoMap")
        AddFullAccessNoAutoMap = (ConvertTo-FormattedArray -inputArray $AddFullAccessNoAutoMap -labelPrefix "Add Full Access No AutoMap")
        AddSendAs = (ConvertTo-FormattedArray -inputArray $AddSendAs -labelPrefix "Add Send As")
        RemoveSendAs = (ConvertTo-FormattedArray -inputArray $RemoveSendAs -labelPrefix "Remove Send As")
        AddSendOnBehalf = (ConvertTo-FormattedArray -inputArray $AddSendOnBehalf -labelPrefix "Add Send On Behalf")
        RemoveSendOnBehalf = (ConvertTo-FormattedArray -inputArray $RemoveSendOnBehalf -labelPrefix "Remove Send On Behalf")
    }
    
    Invoke-CIPPRestMethod -Endpoint $endpoint -body $body -Method 'POST'
}
