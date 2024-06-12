function Set-CIPPUser {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$UserID,
        [Parameter(Mandatory = $false)]
        [string]$DisplayName,
        [Parameter(Mandatory = $false)]
        [string]$UserName,
        [Parameter(Mandatory = $false)]
        [string]$FirstName,
        [Parameter(Mandatory = $false)]
        [string]$LastName,
        [Parameter(Mandatory = $false)]
        [string]$Domain,
        [Parameter(Mandatory = $false)]
        [string]$AddedAliases,
        [Parameter(Mandatory = $false)]
        [string]$CopyFrom,
        [Parameter(Mandatory = $false)]
        [string]$UsageLocation,
        [Parameter(Mandatory = $false)]
        [string]$Department,
        [Parameter(Mandatory = $false)]
        [string]$City,
        [Parameter(Mandatory = $false)]
        [string]$Country,
        [Parameter(Mandatory = $false)]
        [string]$Jobtitle,
        [Parameter(Mandatory = $false)]
        [string]$MobilePhone,
        [Parameter(Mandatory = $false)]
        [string]$StreetAddress,
        [Parameter(Mandatory = $false)]
        [string]$PostalCode,
        [Parameter(Mandatory = $false)]
        [string]$CompanyName,
        [Parameter(Mandatory = $false)]
        [bool]$MustChangePass = $false,
        [Parameter(Mandatory = $false)]
        [array]$AddToGroups = @(),
        [Parameter(Mandatory = $false)]
        [array]$RemoveFromGroups = @(),
        [Parameter(Mandatory = $false)]
        [array]$BusinessPhone = @()
    )

    Write-Verbose "Editing user data for $UserID in $CustomerTenantID"
    
    $existingUser = Get-CIPPUsers -CustomerTenantID $CustomerTenantID -UserID $UserID

    if ($AddToGroups.Count -gt 0) {
        $GroupsToAdd = foreach ($group in $AddToGroups) {
            $CIPPAddGroup = Get-CIPPGroups -CustomerTenantID $CustomerTenantID -GroupID $group
                [PSCustomObject]@{
                    value = [PSCustomObject]@{
                        groupid = $cippAddGroup.ID
                        groupName = $cippAddGroup.DisplayName
                        groupType = $cippAddgroup.calculatedGroupType
                    }
                    label = "$($CIPPAddGroup.DisplayName) - $($CIPPAddGroup.calculatedGroupType)"
                }
        }
    }

    if ($RemoveFromGroups.Count -gt 0) {
        $GroupsToRemove = foreach ($oldgroup in $RemoveFromGroups) {
            $CIPPRemoveGroup = Get-CIPPGroups -CustomerTenantID $CustomerTenantID -GroupID $oldgroup
                [PSCustomObject]@{
                    value = [PSCustomObject]@{
                        groupid = $CIPPRemoveGroup.ID
                        groupName = $CIPPRemoveGroup.DisplayName
                        groupType = $CIPPRemoveGroup.calculatedGroupType
                    }
                    label = "$($CIPPRemoveGroup.DisplayName) - $($CIPPRemoveGroup.calculatedGroupType)"
                }
        }
    }

    $body = @{
        tenantID             = $CustomerTenantID
        UserID               = $UserID
        userPrincipalName    = $UserName ? ($UserName + "@" + $Domain) : $existingUser.UserPrincipalName
        Username             = $UserName ? $UserName : $existingUser.UserName
        DisplayName          = $DisplayName ? $DisplayName : $existingUser.DisplayName
        Domain               = $Domain ? $Domain : $existingUser.primDomain
        firstName            = $FirstName ? $FirstName : $existingUser.GivenName
        LastName             = $LastName ? $LastName : $existingUser.surname
        Jobtitle             = $Jobtitle ? $Jobtitle : $existingUser.Jobtitle
        usageLocation        = $UsageLocation ? $UsageLocation : $existingUser.UsageLocation
        BusinessPhone = if ($BusinessPhone.Count -eq 0) { 
            $existingUser.BusinessPhones 
        } else { 
            $BusinessPhone 
        }
        AddToGroups          = $GroupsToAdd
        RemoveFromGroups     = $GroupsToRemove
        CopyFrom             = $CopyFrom
        Country              = $Country ? $Country : $existingUser.Country
        PostalCode           = $PostalCode ? $PostalCode : $existingUser.PostalCode
        CompanyName          = $CompanyName ? $CompanyName : $existingUser.CompanyName
        StreetAddress        = $StreetAddress ? $StreetAddress : $existingUser.StreetAddress
        MobilePhone          = $MobilePhone ? $MobilePhone : $existingUser.MobilePhone
        Department           = $Department ? $Department : $existingUser.Department
        City                 = $City ? $City : $existingUser.City
    }

    Invoke-CIPPRestMethod -Endpoint "/api/edituser" -Body $body -Method 'POST'
}