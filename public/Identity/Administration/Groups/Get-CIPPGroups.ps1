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
        Write-Error "Only one role switch can be specified at a time."
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
    $endpoint = "/api/listgroups"
    $params = @{
        tenantfilter = $CustomerTenantID
        groupid = $GroupID
    }

    if ($Members) {
        $params.members = "true"
    }

    if ($Owners) {
        $params.owners = "true"
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

