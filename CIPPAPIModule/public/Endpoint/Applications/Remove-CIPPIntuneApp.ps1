<#
.SYNOPSIS
Removes an Intune application.

.DESCRIPTION
The Remove-CIPPIntuneApp function removes an application from Intune.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant. This parameter is mandatory.

.PARAMETER AppID
Specifies the ID of the application to remove. This parameter is mandatory.

.EXAMPLE
Remove-CIPPIntuneApp -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -AppID "98765432-4321-4321-4321-0987654321BA"
Removes the Intune application with ID "98765432-4321-4321-4321-0987654321BA" from the specified tenant.
#>
function Remove-CIPPIntuneApp {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$AppID
    )

    Write-Verbose "Removing Intune application $($AppID)"

    $endpoint = '/api/RemoveApp' 
    $params = @{
        tenantFilter = $CustomerTenantID
        ID           = $AppID # Parameter name from API definition
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Method POST
}