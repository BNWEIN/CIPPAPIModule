<#
.SYNOPSIS
Sets the recipient limits for a mailbox.

.DESCRIPTION
The Set-CIPPRecipientLimits function configures the maximum number of recipients that can be addressed in a single email message for a specified mailbox in the customer's tenant. This helps prevent spam and accidental mass mailings by limiting the number of recipients per message.

.PARAMETER CustomerTenantID
Specifies the customer tenant ID. This parameter is mandatory.

.PARAMETER Identity
Specifies the identity of the mailbox (typically the GUID or primary SMTP address). This parameter is mandatory.

.PARAMETER UserPrincipalName
Specifies the User Principal Name of the mailbox owner. This parameter is used for logging and display purposes. This parameter is mandatory.

.PARAMETER RecipientLimit
Specifies the maximum number of recipients allowed per message. Valid range is typically 1 to 1000. This parameter is mandatory.

.EXAMPLE
Set-CIPPRecipientLimits -CustomerTenantID "contoso.onmicrosoft.com" -Identity "john.doe@contoso.com" -UserPrincipalName "john.doe@contoso.com" -RecipientLimit 500

Sets the recipient limit to 500 recipients per message for john.doe@contoso.com's mailbox.

.EXAMPLE
Set-CIPPRecipientLimits -CustomerTenantID "contoso.onmicrosoft.com" -Identity "jane.smith@contoso.com" -UserPrincipalName "jane.smith@contoso.com" -RecipientLimit 100

Sets the recipient limit to 100 recipients per message for jane.smith@contoso.com's mailbox.

.NOTES
This function requires appropriate permissions to manage mailbox settings in Exchange Online. The recipient limit helps prevent accidental or intentional mass mailings.
#>

function Set-CIPPRecipientLimits {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$Identity,
        [Parameter(Mandatory = $true)]
        [string]$UserPrincipalName,
        [Parameter(Mandatory = $true)]
        [ValidateRange(1, 1000)]
        [int]$RecipientLimit
    )

    Write-Verbose "Setting recipient limit to $RecipientLimit for $UserPrincipalName"

    $endpoint = '/api/ExecSetRecipientLimits'
    $body = @{
        tenantFilter   = $CustomerTenantID
        Identity       = $Identity
        userid         = $UserPrincipalName
        recipientLimit = $RecipientLimit
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
