<#
.SYNOPSIS
Removes an Exchange connector.

.DESCRIPTION
The Remove-CIPPExConnector function removes a specified Exchange connector from CIPP.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

.PARAMETER ConnectorGuid
Specifies the GUID of the connector to remove.

.PARAMETER ConnectorType
Specifies the type of connector. Valid values are 'Receive' and 'Send'.

.EXAMPLE
Remove-CIPPExConnector -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -ConnectorGuid "98765432-4321-4321-4321-BA0987654321" -ConnectorType "Receive"
Removes the specified Receive connector from the specified tenant.

.EXAMPLE
Remove-CIPPExConnector -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -ConnectorGuid "98765432-4321-4321-4321-BA0987654321" -ConnectorType "Send"
Removes the specified Send connector from the specified tenant.

.NOTES
Requires appropriate permissions to manage Exchange connectors.
#>

function Remove-CIPPExConnector {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,

        [Parameter(Mandatory = $true)]
        [guid]$ConnectorGuid,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Receive', 'Send')]
        [string]$ConnectorType
    )

    Write-Verbose "Removing $ConnectorType connector $ConnectorGuid from tenant $CustomerTenantID"

    $endpoint = '/api/RemoveExConnector'
    $body = @{
        tenantFilter = $CustomerTenantID
        GUID         = $ConnectorGuid
        Type         = $ConnectorType
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method Post
}