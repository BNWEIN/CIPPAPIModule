function Get-CIPPAuditLogTest {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantId,
        [Parameter(Mandatory = $true)]
        [validateset('Audit.Exchange','Audit.AzureActiveDirectory')]
        [string]$LogType
    )
   
    Write-Verbose "Looking up $LogType logs for tenant $CustomerTenantId"
    $endpoint = "/api/ListAuditLogTest"
    $params = @{
        TenantFilter = $CustomerTenantId
        LogType = $LogType
    }
    
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}