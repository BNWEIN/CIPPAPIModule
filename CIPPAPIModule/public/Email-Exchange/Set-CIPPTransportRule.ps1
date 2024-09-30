<#
.SYNOPSIS
Sets the state of a transport rule for a specific customer tenant.

.DESCRIPTION
The Set-CIPPTransportRule function is used to set the state of a transport rule for a specific customer tenant in the CIPP API.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which the transport rule needs to be edited.

.PARAMETER State
The state to set for the transport rule. Valid values are "Enable" and "Disable".

.PARAMETER Guid
The GUID of the transport rule to be edited.

.EXAMPLE
Set-CIPPTransportRule -CustomerTenantID "contoso.onmicrosoft.com" -State "Enable" -Guid "abcdefg"
Sets the state of the transport rule with the GUID "abcdefg" to "Enable" for the customer tenant with ID "contoso.onmicrosoft.com".

.EXAMPLE
Set-CIPPTransportRule -CustomerTenantID "contoso.onmicrosoft.com" -State "Disable" -Guid "hijklmn"
Sets the state of the transport rule with the GUID "hijklmn" to "Disable" for the customer tenant with ID "contoso.onmicrosoft.com".
#>

function Set-CIPPTransportRule {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory)]
        [ValidateSet('Enable', 'Disable')]
        [string]$State,
        [Parameter(Mandatory = $true)]
        [guid]$Guid
    )


    Write-Verbose "Editing transport rule for tenant $CustomerTenantID"
    $endpoint = '/api/edittransportrule'
    $params = @{
        TenantFilter = $CustomerTenantID
        state        = $State
        GUID         = $Guid
    }
    
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
