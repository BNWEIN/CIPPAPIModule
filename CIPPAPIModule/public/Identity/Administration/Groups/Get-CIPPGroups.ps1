<#
.SYNOPSIS
    Retrieves information about CIPP groups.

.DESCRIPTION
    The Get-CIPPGroups function retrieves information about CIPP groups based on the provided parameters. It can retrieve all groups for a specific tenant, group details for a specific group, group members for a specific group, or group owners for a specific group.

.PARAMETER CustomerTenantID
    Specifies the ID of the customer tenant for which to retrieve the groups.

.PARAMETER GroupID
    Specifies the ID of the group for which to retrieve the information. If not provided, all groups for the specified tenant will be retrieved.

.PARAMETER Members
    Switch parameter. If specified, retrieves the members of the specified group.

.PARAMETER Owners
    Switch parameter. If specified, retrieves the owners of the specified group.

.EXAMPLE
    Get-CIPPGroups -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778"
    Retrieves all groups for the specified customer tenant.

.EXAMPLE
    Get-CIPPGroups -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -GroupID "abcdefg"
    Retrieves the details of the specified group.

.EXAMPLE
    Get-CIPPGroups -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -GroupID "abcdefg" -Members
    Retrieves the members of the specified group.

.EXAMPLE
    Get-CIPPGroups -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -GroupID "abcdefg" -Owners
    Retrieves the owners of the specified group.
#>
function Get-CIPPGroups {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [GUID]$GroupID,
        [Parameter(Mandatory = $false)]
        [switch]$Members,
        [Parameter(Mandatory = $false)]
        [switch]$Owners
    )

    $switchCount = 0

    if ($Members) { $switchCount++ }
    if ($Owners) { $switchCount++ }

    if ($switchCount -gt 1) {
        Write-Error 'Only one role switch can be specified at a time.'
        return
    } 
    
    if (-not $GroupID) {
        Write-Verbose "Getting all Groups for tenant $CustomerTenantID"
    } elseif ($GroupID -and -not $Members -and -not $Owners) {
        Write-Verbose "Getting Group Details for Group $GroupID"
    } elseif ($GroupID -and $Members -and -not $Owners) {
        Write-Verbose "Getting Group Members for Group $GroupID"
    } elseif ($GroupID -and -not $Members -and $Owners) {
        Write-Verbose "Getting Group Owners for Group $GroupID"
    } 
    $endpoint = '/api/listgroups'
    $params = @{
        tenantFilter = $CustomerTenantID
        groupid      = $GroupID
    }

    if ($Members) {
        $params.members = 'true'
    }

    if ($Owners) {
        $params.owners = 'true'
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
