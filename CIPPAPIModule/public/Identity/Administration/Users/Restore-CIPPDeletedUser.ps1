<#
.SYNOPSIS
    Restores a deleted user in Microsoft 365.

.DESCRIPTION
    The Restore-CIPPDeletedUser function restores a previously deleted user in a specified Microsoft 365 tenant.
    This function calls the CIPP API endpoint to perform the restore operation.

.PARAMETER CustomerTenantID
    The tenant ID of the Microsoft 365 customer where the user should be restored.

.PARAMETER ID
    The unique identifier (GUID) of the deleted user to restore.

.EXAMPLE
    Restore-CIPPDeletedUser -CustomerTenantID "contoso.onmicrosoft.com" -ID "12345678-1234-1234-1234-123456789012"
    
    Restores the specified deleted user in the Contoso tenant.

.NOTES
    This function requires appropriate permissions to restore deleted users in the specified tenant.

.LINK
    https://cipp.app/

.ALIAS
    Set-CIPPRestoreDeletedUser
#>
function Restore-CIPPDeletedUser {
    [CmdletBinding()]
    [Alias('Set-CIPPRestoreDeletedUser')]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [guid]$ID
    )

    Write-Verbose "Restoring user: $ID"

    $endpoint = '/api/ExecRestoreDeleted'
    $Body = @{
        tenantFilter = $CustomerTenantID
        Id           = $ID
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $Body -Method POST
}
