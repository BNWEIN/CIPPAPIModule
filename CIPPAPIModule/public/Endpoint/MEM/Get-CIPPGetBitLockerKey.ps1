<#
.SYNOPSIS
Gets the BitLocker recovery key for a specified computer.

.DESCRIPTION
The Get-CIPPGetBitLockerKey function retrieves the BitLocker recovery key for a specified computer in the CIPP project.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant.

.PARAMETER guid
Specifies the GUID of the computer for which to retrieve the BitLocker recovery key.

.EXAMPLE
Get-CIPPGetBitLockerKey -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -guid "01234567-89AB-CDEF-0123-456789ABCDEF"
Retrieves the BitLocker recovery key for the computer with the specified GUID in the CIPP project.

#>
Function Get-CIPPGetBitLockerKey {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [guid]$GUID
    )

    Write-Verbose "Getting bitlocker key for computer: $GUID"
    
    # Define the endpoint and parameters
    $endpoint = '/api/ExecGetRecoveryKey'
    $body = @{
        tenantFilter = $CustomerTenantID
        GUID         = $GUID 
    }
    
    # Use the Invoke-CIPPRequest function to make the request
    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST 
}