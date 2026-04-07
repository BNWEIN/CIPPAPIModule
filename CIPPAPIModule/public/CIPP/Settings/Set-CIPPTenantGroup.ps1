<#
.SYNOPSIS
Creates or updates a CIPP tenant group.

.DESCRIPTION
The Set-CIPPTenantGroup function creates or updates a tenant group in CIPP using the ExecTenantGroup endpoint.
For static groups, the provided Members list is used as a full replacement of the current membership --
include all desired members (existing and new) in a single call.

.PARAMETER GroupName
The display name of the tenant group.

.PARAMETER GroupId
Optional. The GUID of the group to update. If omitted, a new GUID is generated and a new group is created.

.PARAMETER GroupDescription
Optional. A description for the tenant group.

.PARAMETER GroupType
Optional. The type of group: 'static' (manually managed members) or 'dynamic' (rule-based). Defaults to 'static'.

.PARAMETER Members
Optional. An array of member hashtables for static groups. Each entry must contain:
  value - the tenant customerId (GUID)
  label - the tenant display name

.EXAMPLE
Set-CIPPTenantGroup -GroupName 'Complea Spamfilter' -GroupId '12345678-1234-1234-1234-1234567890AB' -Members @(
    @{ value = 'tenant-guid-1'; label = 'Contoso Ltd' },
    @{ value = 'tenant-guid-2'; label = 'Fabrikam Inc' }
)
Creates or updates the 'Complea Spamfilter' group with the specified members.

.EXAMPLE
Set-CIPPTenantGroup -GroupName 'New Group' -GroupDescription 'A new static tenant group'
Creates a new static group with no members.

#>
function Set-CIPPTenantGroup {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$GroupName,

        [Parameter(Mandatory = $false)]
        [string]$GroupId,

        [Parameter(Mandatory = $false)]
        [string]$GroupDescription,

        [Parameter(Mandatory = $false)]
        [ValidateSet('static', 'dynamic')]
        [string]$GroupType = 'static',

        [Parameter(Mandatory = $false)]
        [array]$Members
    )

    Write-Verbose "Setting tenant group '$GroupName'"
    $endpoint = '/api/ExecTenantGroup'

    $body = @{
        Action           = 'AddEdit'
        groupId          = if ($GroupId) { $GroupId } else { [guid]::NewGuid().ToString() }
        groupName        = $GroupName
        groupDescription = $GroupDescription
        groupType        = $GroupType
        members          = $Members
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method 'POST'
}
