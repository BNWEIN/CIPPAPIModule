<#
.SYNOPSIS
    Sets the option to copy sent items to a shared mailbox for a specific user.

.DESCRIPTION
    The Set-CIPPCopyToSent function sets the option to copy sent items to a shared mailbox for a specific user in the CIPP system.

.PARAMETER CustomerTenantID
    Specifies the ID of the customer's tenant.

.PARAMETER UserID
    Specifies the ID of the user.

.PARAMETER MessageCopyForSentAsEnabled
    Specifies whether to enable or disable the option to copy sent items for the user. Valid values are "true" or "false". The default value is "true".

.EXAMPLE
    Set-CIPPCopyToSent -CustomerTenantID "contoso.onmicrosoft.com" -UserID "john.doe@domain.com" -MessageCopyForSentAsEnabled "true"

    This example sets the option to copy sent items to a shared mailbox for the user "john.doe@domain.com" in the customer's tenant with ID "contoso.onmicrosoft.com".

#>
function Set-CIPPCopyToSent {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID,
        [Parameter(Mandatory = $false)]
        [ValidateSet(
            'true',
            'false' 
        )]
        [string]$MessageCopyForSentAsEnabled = 'true'
    )


    Write-Verbose "Copy Sent Items to Shared Mailbox for $userID $MessageCopyForSentAsEnabled"

    $endpoint = '/api/ExecCopyForSent'
    $body = @{
        tenantFilter                = $CustomerTenantID
        ID                          = $UserID
        MessageCopyForSentAsEnabled = $MessageCopyForSentAsEnabled
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
