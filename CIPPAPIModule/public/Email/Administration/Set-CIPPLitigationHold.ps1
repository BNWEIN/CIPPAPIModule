<#
.SYNOPSIS
Sets the litigation hold status for a mailbox.

.DESCRIPTION
The Set-CIPPLitigationHold function enables or disables litigation hold for a specified mailbox in the customer's tenant. Litigation hold preserves all mailbox content, including deleted items and original versions of modified items. Optionally, you can specify a duration for the hold in days.

.PARAMETER CustomerTenantID
Specifies the customer tenant ID. This parameter is mandatory.

.PARAMETER Identity
Specifies the identity of the mailbox (typically the GUID or primary SMTP address). This parameter is mandatory.

.PARAMETER UserPrincipalName
Specifies the User Principal Name of the mailbox owner. This parameter is used for logging and display purposes. This parameter is mandatory.

.PARAMETER Disable
Specifies whether to disable litigation hold. If this switch is present, litigation hold will be disabled. If not present, litigation hold will be enabled. This parameter is optional.

.PARAMETER Days
Specifies the duration of the litigation hold in days. This parameter is only applicable when enabling litigation hold (Disable switch not present). If set to 0 or not specified, the hold will be indefinite. This parameter is optional.

.EXAMPLE
Set-CIPPLitigationHold -CustomerTenantID "contoso.onmicrosoft.com" -Identity "john.doe@contoso.com" -UserPrincipalName "john.doe@contoso.com"

Enables indefinite litigation hold for john.doe@contoso.com's mailbox.

.EXAMPLE
Set-CIPPLitigationHold -CustomerTenantID "contoso.onmicrosoft.com" -Identity "jane.smith@contoso.com" -UserPrincipalName "jane.smith@contoso.com" -Days 365

Enables litigation hold for jane.smith@contoso.com's mailbox for 365 days.

.EXAMPLE
Set-CIPPLitigationHold -CustomerTenantID "contoso.onmicrosoft.com" -Identity "bob.jones@contoso.com" -UserPrincipalName "bob.jones@contoso.com" -Disable

Disables litigation hold for bob.jones@contoso.com's mailbox.

.NOTES
This function requires appropriate permissions to manage mailbox settings in Exchange Online. Litigation hold is a premium feature that may require specific licensing.
#>

function Set-CIPPLitigationHold {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$Identity,
        [Parameter(Mandatory = $true)]
        [string]$UserPrincipalName,
        [Parameter(Mandatory = $false)]
        [switch]$Disable,
        [Parameter(Mandatory = $false)]
        [int]$Days = 0
    )

    Write-Verbose "Setting litigation hold for $UserPrincipalName"

    $endpoint = '/api/ExecSetLitigationHold'
    $body = @{
        tenantFilter = $CustomerTenantID
        Identity     = $Identity
        UPN          = $UserPrincipalName
        disable      = $Disable.IsPresent
        days         = $Days
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
