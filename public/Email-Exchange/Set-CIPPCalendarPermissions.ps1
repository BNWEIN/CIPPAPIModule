function Set-CIPPCalendarPermissions {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $false)]
        [ValidateSet(
            "Author", 
            "Contributor", 
            "Editor", 
            "Owner",
            "Non Editing Author",
            "Publishing Author",
            "Publishing Editor", 
            "Reviewer", 
            "LimitedDetails", 
            "AvailabilityOnly" 
            )]
        [string]$Permissions,
        [Parameter(Mandatory = $true)]
        [string]$Userid,
        [Parameter(Mandatory = $false)]
        [string]$RemoveAccess,
        [Parameter(Mandatory = $false)]
        [string]$usertogetpermissions,
        [Parameter(Mandatory = $false)]
        [string]$FolderName = "Calendar"
    )


    Write-Verbose "Editing calendar permissions for $Userid"
    $endpoint = "/api/execeditcalendarpermissions"
    $params = @{
        TenantFilter = $CustomerTenantID
        permissions = $Permissions
        userid = $Userid
        removeaccess = $RemoveAccess
        usertogetpermissions = $usertogetpermissions
        FolderName = $FolderName
    }
    
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

