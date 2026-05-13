<#
.SYNOPSIS
Sets the language and regional settings (locale) for a mailbox.

.DESCRIPTION
The Set-CIPPMailboxLocale function configures the language and regional settings (locale) for a specified mailbox in the customer's tenant. This affects the language used in Outlook Web App, date and time formats, and other regional settings for the mailbox.

.PARAMETER CustomerTenantID
Specifies the customer tenant ID. This parameter is mandatory.

.PARAMETER UserPrincipalName
Specifies the User Principal Name of the mailbox owner. This parameter is mandatory.

.PARAMETER Locale
Specifies the locale/language code to set (e.g., "en-US" for English (United States), "fr-FR" for French (France), "de-DE" for German (Germany)). This parameter is mandatory.

.EXAMPLE
Set-CIPPMailboxLocale -CustomerTenantID "contoso.onmicrosoft.com" -UserPrincipalName "john.doe@contoso.com" -Locale "en-US"

Sets the mailbox locale to English (United States) for john.doe@contoso.com.

.EXAMPLE
Set-CIPPMailboxLocale -CustomerTenantID "contoso.onmicrosoft.com" -UserPrincipalName "jean.dupont@contoso.com" -Locale "fr-FR"

Sets the mailbox locale to French (France) for jean.dupont@contoso.com.

.NOTES
This function requires appropriate permissions to manage mailbox settings in Exchange Online. The locale code should be a valid culture code (e.g., "en-US", "de-DE", "ja-JP").
#>

function Set-CIPPMailboxLocale {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserPrincipalName,
        [Parameter(Mandatory = $true)]
        [string]$Locale
    )

    Write-Verbose "Setting mailbox locale to $Locale for $UserPrincipalName"

    $endpoint = '/api/ExecSetMailboxLocale'
    $body = @{
        tenantFilter = $CustomerTenantID
        user         = $UserPrincipalName
        locale       = $Locale
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
