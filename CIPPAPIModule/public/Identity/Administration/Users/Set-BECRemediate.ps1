<#
.SYNOPSIS
    Runs BEC Remediation for a specified user.

.DESCRIPTION
    The Set-BECRemediate function is used to initiate BEC (Business Email Compromise) remediation for a specified user.

.PARAMETER CustomerTenantID
    Specifies the ID of the customer's tenant.

.PARAMETER Username
    Specifies the username of the user to remediate.

.PARAMETER Userid
    Specifies the ID of the user to remediate.

.EXAMPLE
    Set-BECRemediate -CustomerTenantID "contoso.onmicrosoft.com" -Username "john.doe@contoso.onmicrosoft.com" -Userid "a75d9c41-4cff-4017-8ddd-d413591c8c1e"

    This example runs BEC remediation for the user with the username "john.doe@contoso.onmicrosoft.com" and the ID "a75d9c41-4cff-4017-8ddd-d413591c8c1e" in the customer's tenant with the ID "contoso.onmicrosoft.com".

#>
function Set-BECRemediate {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$Username,
        [Parameter(Mandatory = $true)]
        [string]$Userid
    )
    
    Write-Verbose "Running BEC Remediation for $Username"

    $endpoint = '/api/execbecremediate'
    $body = @{
        tenantFilter = $CustomerTenantID
        username     = $Username
        userid       = $Userid
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}
