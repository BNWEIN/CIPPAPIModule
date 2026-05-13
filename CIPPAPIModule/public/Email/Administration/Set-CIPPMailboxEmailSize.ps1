<#
.SYNOPSIS
Sets the maximum email send and receive size for a mailbox.

.DESCRIPTION
The Set-CIPPMailboxEmailSize function configures the maximum email message size limits for sending and receiving messages for a specified mailbox in the customer's tenant. This allows you to control the size of emails that a user can send or receive, overriding tenant-wide defaults.

.PARAMETER CustomerTenantID
Specifies the customer tenant ID. This parameter is mandatory.

.PARAMETER UserPrincipalName
Specifies the User Principal Name of the mailbox owner. Either UserPrincipalName or UserId must be specified.

.PARAMETER UserId
Specifies the unique identifier of the mailbox. Either UserPrincipalName or UserId must be specified.

.PARAMETER MaxSendSize
Specifies the maximum size in megabytes (MB) of messages that can be sent from this mailbox. Valid range is 1 to 150 MB. Either MaxSendSize or MaxReceiveSize must be specified.

.PARAMETER MaxReceiveSize
Specifies the maximum size in megabytes (MB) of messages that can be received by this mailbox. Valid range is 1 to 150 MB. Either MaxSendSize or MaxReceiveSize must be specified.

.EXAMPLE
Set-CIPPMailboxEmailSize -CustomerTenantID "contoso.onmicrosoft.com" -UserPrincipalName "john.doe@contoso.com" -MaxSendSize 25 -MaxReceiveSize 36

Sets the maximum send size to 25 MB and maximum receive size to 36 MB for john.doe@contoso.com's mailbox.

.EXAMPLE
Set-CIPPMailboxEmailSize -CustomerTenantID "contoso.onmicrosoft.com" -UserPrincipalName "jane.smith@contoso.com" -MaxSendSize 50

Sets only the maximum send size to 50 MB for jane.smith@contoso.com's mailbox, leaving the receive size at the default.

.EXAMPLE
Set-CIPPMailboxEmailSize -CustomerTenantID "contoso.onmicrosoft.com" -UserPrincipalName "admin@contoso.com" -MaxReceiveSize 100

Sets only the maximum receive size to 100 MB for admin@contoso.com's mailbox.

.EXAMPLE
Set-CIPPMailboxEmailSize -CustomerTenantID "contoso.onmicrosoft.com" -UserId "11111111-1111-1111-1111-111111111111" -MaxSendSize 75 -MaxReceiveSize 100

Sets both send and receive size limits using the UserId instead of UserPrincipalName.

.NOTES
This function requires appropriate permissions to manage mailbox settings in Exchange Online. Size values are specified in megabytes (MB) with a valid range of 1 to 150 MB.
#>

function Set-CIPPMailboxEmailSize {
    [CmdletBinding(DefaultParameterSetName = 'Both_UPN')]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true, ParameterSetName = 'SendOnly_UPN')]
        [Parameter(Mandatory = $true, ParameterSetName = 'ReceiveOnly_UPN')]
        [Parameter(Mandatory = $true, ParameterSetName = 'Both_UPN')]
        [string]$UserPrincipalName,
        [Parameter(Mandatory = $true, ParameterSetName = 'SendOnly_ID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'ReceiveOnly_ID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'Both_ID')]
        [string]$UserId,
        [Parameter(Mandatory = $true, ParameterSetName = 'SendOnly_UPN')]
        [Parameter(Mandatory = $true, ParameterSetName = 'SendOnly_ID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'Both_UPN')]
        [Parameter(Mandatory = $true, ParameterSetName = 'Both_ID')]
        [ValidateRange(1, 150)]
        [int]$MaxSendSize,
        [Parameter(Mandatory = $true, ParameterSetName = 'ReceiveOnly_UPN')]
        [Parameter(Mandatory = $true, ParameterSetName = 'ReceiveOnly_ID')]
        [Parameter(Mandatory = $true, ParameterSetName = 'Both_UPN')]
        [Parameter(Mandatory = $true, ParameterSetName = 'Both_ID')]
        [ValidateRange(1, 150)]
        [int]$MaxReceiveSize
    )

    $identifier = if ($PSBoundParameters.ContainsKey('UserPrincipalName')) { $UserPrincipalName } else { $UserId }
    Write-Verbose "Setting mailbox email size limits for $identifier"

    $endpoint = '/api/ExecSetMailboxEmailSize'
    $body = @{
        tenantFilter = $CustomerTenantID
    }

    if ($PSBoundParameters.ContainsKey('UserPrincipalName')) {
        $body['UPN'] = $UserPrincipalName
    }

    if ($PSBoundParameters.ContainsKey('UserId')) {
        $body['id'] = $UserId
    }

    if ($PSBoundParameters.ContainsKey('MaxSendSize')) {
        $body.maxSendSize = $MaxSendSize
    }

    if ($PSBoundParameters.ContainsKey('MaxReceiveSize')) {
        $body.maxReceiveSize = $MaxReceiveSize
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
