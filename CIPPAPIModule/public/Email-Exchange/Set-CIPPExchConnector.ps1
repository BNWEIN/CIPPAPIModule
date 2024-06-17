<#
.SYNOPSIS
Sets the state and type of an Exchange Connector for a specific customer tenant.

.DESCRIPTION
The Set-CIPPExchConnector function is used to edit the state and type of an Exchange Connector for a specific customer tenant. It sends a REST API request to update the connector settings.

.PARAMETER CustomerTenantID
The ID of the customer tenant for which the Exchange Connector needs to be edited.

.PARAMETER State
The state of the Exchange Connector. Valid values are "Enable" and "Disabled".

.PARAMETER Guid
The GUID of the Exchange Connector.

.PARAMETER Type
The type of the Exchange Connector.

.EXAMPLE
Set-CIPPExchConnector -CustomerTenantID "contoso.onmicrosoft.com" -State "Enable" -Guid "abcdefg" -Type "Inbound"

This example sets the state of the Exchange Connector for the customer tenant with ID "contoso.onmicrosoft.com" to "Enable", using the GUID "abcdefg" and the type "Inbound".

#>
function Set-CIPPExchConnector {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory)]
        [ValidateSet("Enable", "Disabled")]
        [string]$State,
        [Parameter(Mandatory = $true)]
        [guid]$Guid,
        [Parameter(Mandatory = $true)]
        [string]$Type
    )


    Write-Verbose "Editing Exchange Connector for tenant $CustomerTenantID"
    $endpoint = "/api/editexconnector"
    $params = @{
        TenantFilter = $CustomerTenantID
        state = $State
        GUID = $Guid
        Type = $Type
    }
    
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
