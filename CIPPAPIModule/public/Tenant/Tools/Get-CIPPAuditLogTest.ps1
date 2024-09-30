<#
.SYNOPSIS
Retrieves audit logs for a specified customer tenant.

.DESCRIPTION
The Get-CIPPAuditLogTest function retrieves audit logs for a specified customer tenant based on the log type.

.PARAMETER CustomerTenantId
Specifies the ID of the customer tenant for which to retrieve audit logs.

.PARAMETER LogType
Specifies the type of audit logs to retrieve. Valid values are 'Audit.Exchange' and 'Audit.AzureActiveDirectory'.

.EXAMPLE
Get-CIPPAuditLogTest -CustomerTenantId "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -LogType "Audit.Exchange"
Retrieves Exchange audit logs for the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.EXAMPLE
Get-CIPPAuditLogTest -CustomerTenantId "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -LogType "Audit.AzureActiveDirectory"
Retrieves Azure Active Directory audit logs for the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778".

.EXAMPLE
Get-CIPPAuditLogTest -CustomerTenantId "test.onmicrosoft.com" -LogType "Audit.Exchange"
Retrieves Azure Active Directory audit logs for the customer tenant "test.onmicrosoft.com".
#>

function Get-CIPPAuditLogTest {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantId,
        [Parameter(Mandatory = $true)]
        [validateset('Audit.Exchange', 'Audit.AzureActiveDirectory')]
        [string]$LogType
    )
   
    Write-Verbose "Looking up $LogType logs for tenant $CustomerTenantId"
    $endpoint = '/api/ListAuditLogTest'
    $params = @{
        TenantFilter = $CustomerTenantId
        LogType      = $LogType
    }
    
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}