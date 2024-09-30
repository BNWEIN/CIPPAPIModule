<#
.SYNOPSIS
    Manages quarantine for a specific customer tenant ID.

.DESCRIPTION
    The Set-CIPPQuarantineManagement function is used to manage quarantine for a specific customer tenant ID. It allows you to set various parameters such as the ID, AllowSender, and Type.

.PARAMETER CustomerTenantID
    Specifies the customer tenant ID for which the quarantine management is performed. This parameter is mandatory.

.PARAMETER ID
    Specifies the ID of the quarantine management. This parameter is mandatory.

.PARAMETER AllowSender
    Specifies whether to allow the sender. Valid values are 'true' or 'false'. This parameter is optional.

.PARAMETER Type
    Specifies the type of quarantine management. Valid values are 'Deny' or 'Release'. This parameter is mandatory.

.EXAMPLE
    Set-CIPPQuarantineManagement -CustomerTenantID "contoso.onmicrosoft.com" -ID "67890" -AllowSender "true" -Type "Deny"

    This example sets the quarantine management for the customer tenant ID "contoso.onmicrosoft.com" with the ID "67890". It allows the sender and sets the type to "Deny".

#>
function Set-CIPPQuarantineManagement {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$ID,
        [Parameter(Mandatory = $false)]
        [ValidateSet(
            'true',
            'false'
        )]
        [string]$AllowSender,
        [Parameter(Mandatory = $true)]
        [ValidateSet(
            'Deny',
            'Release'
        )]
        [string]$Type
    )

    Write-Verbose "Managing Quarantine for $CustomerTenantID"
    $endpoint = '/api/execquarantinemanagement'
    $params = @{
        tenantfilter = $CustomerTenantID
        id           = $ID
        allowSender  = $AllowSender
        type         = $Type
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}