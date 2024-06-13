function Get-CIPPAuditLogTest {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantId,
        [Parameter(Mandatory = $true)]
        [string]$LogType
    )
   
    Write-Verbose "Looking up audit logs for tenant $CustomerTenantId of type $LogType"
    $endpoint = "/api/ListAuditLogTest"
    $params = @{
        TenantFilter = $CustomerTenantId
        LogType = $LogType
    }
    
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}