<#
.SYNOPSIS
    Adds a shared mailbox to a specified tenant.

.DESCRIPTION
    This function adds a shared mailbox to a specified tenant using the provided tenant ID, display name, domain, and username. Optionally, additional aliases can be added.

.PARAMETER CustomerTenantID
    The ID of the customer tenant where the shared mailbox will be added. This parameter is mandatory.
    Either TenantID or Default domain can be used to identify the tenant.

.PARAMETER DisplayName
    The display name for the shared mailbox. This parameter is mandatory.

.PARAMETER Domain
    The domain for the shared mailbox. This parameter is mandatory.

.PARAMETER Username
    The username for the shared mailbox. This parameter is mandatory.

.PARAMETER AddedAliases
    An array of additional aliases to be added to the shared mailbox. This parameter is optional.

.EXAMPLE
    Add-CIPPSharedMailbox -CustomerTenantID "d6766bb9-44e0-4a4b-b8d0-3d9c4d1d15cc" -DisplayName "Support" -Domain "example.com" -Username "support"
    This example adds a shared mailbox with the display name "Support" and the username "support" to the tenant "d6766bb9-44e0-4a4b-b8d0-3d9c4d1d15cc".

.EXAMPLE
    Add-CIPPSharedMailbox -CustomerTenantID "example.com" -DisplayName "Support" -Domain "example.com" -Username "support" -AddedAliases "itsupport@example.com"
    This example adds a shared mailbox with the display name "Support" and the username "support" to the tenant "example.com". One additional alias is also added to the mailbox.

.EXAMPLE
    Add-CIPPSharedMailbox -CustomerTenantID "example.com" -DisplayName "Support" -Domain "example.com" -Username "support" -AddedAliases 'itsupport@example.com','helpdesk@example.com','sos@example.com'
    This example adds a shared mailbox with the display name "Support" and the username "support" to the tenant "example.com". Three additional aliases is also added to the mailbox.
    The AddedAliases parameter accepts an array of strings.


.NOTES
    This function uses the Invoke-CIPPRestMethod cmdlet to send a POST request to the /api/AddSharedMailbox endpoint.
#>

function Add-CIPPSharedMailbox {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$DisplayName,
        [Parameter(Mandatory = $true)]
        [string]$Domain,
        [Parameter(Mandatory = $true)]
        [string]$Username,
        [Parameter(Mandatory = $false)]
        [array]$AddedAliases
    )

    Write-Verbose "Adding Shared mailbox in tenant: $CustomerTenantID"
    $Endpoint = '/api/AddSharedMailbox'
    $body = @{
        tenantID     = $CustomerTenantID
        displayName  = $DisplayName
        username     = $Username
        domain       = $Domain
        AddedAliases = $AddedAliases

    }
    Invoke-CIPPRestMethod -Endpoint $Endpoint -Body $body -Method POST
}
