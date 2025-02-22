<#
.SYNOPSIS
Removes a mail contact from Exchange.

.DESCRIPTION
The Remove-CIPPContact function removes a specified mail contact from Exchange in CIPP.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER ContactGuid
Specifies the GUID of the mail contact to remove.

.EXAMPLE
Remove-CIPPContact -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -ContactGuid "98765432-4321-4321-4321-BA0987654321"
Removes the mail contact with the specified GUID from the specified tenant.

.NOTES
Requires appropriate permissions to manage Exchange contacts.
#>

function Remove-CIPPContact {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true)]
        [guid]$ContactGuid
    )

    Write-Verbose "Removing mail contact $ContactGuid from tenant $CustomerTenantID"

    $endpoint = '/api/RemoveContact'
    $body = @{
        tenantFilter = $CustomerTenantID
        GUID         = $ContactGuid
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method Post
}