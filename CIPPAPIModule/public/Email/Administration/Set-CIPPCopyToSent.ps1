<#
.SYNOPSIS
    Sets the option to copy sent items to a shared mailbox for a specific user.

.DESCRIPTION
    The Set-CIPPCopyToSent function sets the option to copy sent items to a shared mailbox for a specific mailbox in the CIPP system.

.PARAMETER CustomerTenantID
    Specifies the ID of the customer's tenant.

.PARAMETER UserID
    Specifies the ID of the mailbox to set the copy sent items option for.

.PARAMETER MessageCopyState
    Specifies whether to enable or disable the option to copy sent items for the mailbox. 

.EXAMPLE
    Set-CIPPCopyToSent -CustomerTenantID "contoso.onmicrosoft.com" -UserID "john.doe@domain.com" -MessageCopyState $true

    This example sets the option to copy sent items to a shared mailbox for the user "john.doe@domain.com" in the customer's tenant with ID "contoso.onmicrosoft.com".

#>
function Set-CIPPCopyToSent {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID,
        [Parameter(Mandatory = $false)]
        [Alias('MessageCopyForSentAsEnabled')]
        [bool]$MessageCopyState = $true
    )


    Write-Verbose "Copy Sent Items to Shared Mailbox for $UserID $MessageCopyState"
    $endpoint = '/api/ExecCopyForSent'
    $body = @{
        tenantFilter     = $CustomerTenantID
        ID               = $UserID
        messageCopyState = $MessageCopyState
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
