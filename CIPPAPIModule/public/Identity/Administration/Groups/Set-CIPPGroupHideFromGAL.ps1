<#
.SYNOPSIS
Sets the "hide from GAL" property for a specified group.

.DESCRIPTION
The Set-CIPPGroupHideFromGAL function is used to set the "hide from GAL" property for a specified group in the CIPP (Cloud Identity and Privacy Protection) system. This function requires the customer tenant ID, group ID, group type, and the hide from GAL value as input parameters.

.PARAMETER CustomerTenantID
Specifies the ID of the customer tenant. This parameter is mandatory.

.PARAMETER GroupID
Specifies the ID of the group. This parameter is mandatory.

.PARAMETER GroupType
Specifies the type of the group. Valid values are 'Distribution List', 'Mail-Enabled Security', 'Microsoft 365', and 'Security'. This parameter is mandatory.

.PARAMETER HideFromGAL
Specifies whether the group should be hidden from the Global Address List (GAL). Valid values are 'true' and 'false'. This parameter is mandatory.

.EXAMPLE
Set-CIPPGroupHideFromGAL -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -GroupID "98765432-4321-4321-4321-0987654321BA" -GroupType "Distribution List" -HideFromGAL "true"
Sets the "hide from GAL" property to true for the specified distribution list group.

.EXAMPLE
Set-CIPPGroupHideFromGAL -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -GroupID "98765432-4321-4321-4321-0987654321BA" -GroupType "Security" -HideFromGAL "false"
Sets the "hide from GAL" property to false for the specified security group.
#>

function Set-CIPPGroupHideFromGAL {
    param (
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [guid]$GroupID,
        [Parameter(Mandatory = $true)]
        [ValidateSet(
            'Distribution List',
            'Mail-Enabled Security',
            'Microsoft 365',
            'Security'
        )]
        [string]$GroupType,
        [Parameter(Mandatory = $true)]
        [ValidateSet(
            'true',
            'false'
        )]
        [string]$HideFromGAL
    )

    Write-Verbose "Setting hide from GAL to $HideFromGAL for $GroupID"

    $endpoint = '/api/ExecGroupsHideFromGAL'
    $body = @{
        tenantFilter = $CustomerTenantID
        ID           = $GroupID
        GroupType    = $GroupType
        HideFromGAL  = $HideFromGAL
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method POST
}