<#
.SYNOPSIS
Sets the delivery management settings for a group.

.DESCRIPTION
The Set-CIPPGroupDeliveryManagement function is used to set the delivery management settings for a group in the CIPP project. It allows you to specify the customer tenant ID, group ID, group type, and whether to only allow internal delivery.

.PARAMETER CustomerTenantID
The ID of the customer tenant.

.PARAMETER GroupID
The ID of the group.

.PARAMETER GroupType
The type of the group. Valid values are 'Distribution List', 'Mail-Enabled Security', and 'Microsoft 365'.

.PARAMETER OnlyAllowInternal
Specifies whether to only allow internal delivery. Valid values are 'true' and 'false'.

.EXAMPLE
Set-CIPPGroupDeliveryManagement -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -GroupID "67890" -GroupType "Distribution List" -OnlyAllowInternal "true"
Sets the delivery management settings for the group with the specified customer tenant ID, group ID, group type, and only allow internal delivery.

#>

function Set-CIPPGroupDeliveryManagement {
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [guid]$GroupID,
        [Parameter(Mandatory = $true)]
        [validateset(
            'Distribution List',
            'Mail-Enabled Security',
            'Microsoft 365'
        )]
        [string]$Grouptype,
        [Parameter(Mandatory = $true)]
        [validateset(
            'true',
            'false'
            )]
        [string]$onlyallowinternal
    )

    Write-Verbose "Setting delivery management for group: $GroupID"

    $endpoint = "/api/execgroupsdeliverymanagement"
    $params = @{
        tenantfilter                = $CustomerTenantID
        id                          = $GroupID
        grouptype                   = $Grouptype
        onlyallowinternal           = $onlyallowinternal
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
    
}