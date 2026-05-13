<#
.SYNOPSIS
Sets the retention hold status for a mailbox.

.DESCRIPTION
The Set-CIPPRetentionHold function enables or disables retention hold for a specified mailbox in the customer's tenant. Retention hold prevents the Managed Folder Assistant from processing the mailbox, preserving retention policies during mailbox migrations or investigations. This is useful when you need to temporarily suspend retention policy processing.

.PARAMETER CustomerTenantID
Specifies the customer tenant ID. This parameter is mandatory.

.PARAMETER Identity
Specifies the identity of the mailbox (typically the GUID or primary SMTP address). This parameter is mandatory.

.PARAMETER UserPrincipalName
Specifies the User Principal Name of the mailbox owner. This parameter is used for logging and display purposes. This parameter is mandatory.

.PARAMETER Disable
Specifies whether to disable retention hold. If this switch is present, retention hold will be disabled. If not present, retention hold will be enabled. This parameter is optional.

.EXAMPLE
Set-CIPPRetentionHold -CustomerTenantID "contoso.onmicrosoft.com" -Identity "john.doe@contoso.com" -UserPrincipalName "john.doe@contoso.com"

Enables retention hold for john.doe@contoso.com's mailbox.

.EXAMPLE
Set-CIPPRetentionHold -CustomerTenantID "contoso.onmicrosoft.com" -Identity "jane.smith@contoso.com" -UserPrincipalName "jane.smith@contoso.com" -Disable

Disables retention hold for jane.smith@contoso.com's mailbox, allowing retention policies to be processed again.

.NOTES
This function requires appropriate permissions to manage mailbox settings in Exchange Online. Retention hold is typically used during mailbox migrations or legal investigations.
#>

function Set-CIPPRetentionHold {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$Identity,
        [Parameter(Mandatory = $true)]
        [string]$UserPrincipalName,
        [Parameter(Mandatory = $false)]
        [switch]$Disable
    )

    Write-Verbose "Setting retention hold for $UserPrincipalName"

    $endpoint = '/api/ExecSetRetentionHold'
    $body = @{
        tenantFilter = $CustomerTenantID
        Identity     = $Identity
        UPN          = $UserPrincipalName
        disable      = $Disable.IsPresent
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
