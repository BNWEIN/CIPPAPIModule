<#
.SYNOPSIS
Restores a deleted user in the CIPP system.

.DESCRIPTION
The Set-CIPPRestoreDeletedUser function restores a deleted user in the CIPP (Customer Identity and Privacy Platform) system. It sends a request to the CIPP API to restore the user with the specified ID.

.PARAMETER CustomerTenantID
The ID of the customer tenant in which the user is being restored.

.PARAMETER ID
The ID of the user to be restored.

.EXAMPLE
Set-CIPPRestoreDeletedUser -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -ID "32a411a8-65ad-4358-ac14-5027d9abea9a"
Restores the user with the ID "32a411a8-65ad-4358-ac14-5027d9abea9a" in the customer tenant with the ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

#>

function Set-CIPPRestoreDeletedUser {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$ID
    )

    Write-Verbose "Restoring user: $ID"

    $endpoint = '/api/execrestoredeleted'
    $params = @{
        tenantfilter = $CustomerTenantID
        Id           = $ID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
