<#
.SYNOPSIS
    Adds a shared mailbox to a specified tenant.

.DESCRIPTION
    This function adds a shared mailbox to a specified tenant using the provided tenant ID, display name, domain, and username. Optionally, additional aliases can be added.

.PARAMETER CustomerTenantID
    The ID of the customer tenant where the shared mailbox will be added. This parameter is mandatory.

.PARAMETER DisplayName
    The display name for the shared mailbox. This parameter is mandatory.

.PARAMETER Domain
    The domain for the shared mailbox. This parameter is mandatory.

.PARAMETER Username
    The username for the shared mailbox. This parameter is mandatory.

.PARAMETER AddedAliases
    An array of additional aliases to be added to the shared mailbox. This parameter is optional.

.EXAMPLE
    Add-SharedMailbox -CustomerTenantID "d6766bb9-44e0-4a4b-b8d0-3d9c4d1d15cc" -DisplayName "Support" -Domain "example.com" -Username "support"

.EXAMPLE
    Add-SharedMailbox -CustomerTenantID "example.com" -DisplayName "Support" -Domain "example.com" -Username "support" -AddedAliases "

.NOTES
    This function uses the Invoke-CIPPRestMethod cmdlet to send a POST request to the /api/AddSharedMailbox endpoint.
#>

function Add-SharedMailbox {
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
