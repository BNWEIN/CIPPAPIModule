function Get-CIPPCalendarPerms {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$UserID
        )

    Write-Verbose "Getting user calender permissions for user: $UserID"
    $Endpoint = "/api/listcalendarpermissions"
    $Params = @{
        tenantfilter = $CustomerTenantID
        userId = $UserID
    }
    Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params
}

