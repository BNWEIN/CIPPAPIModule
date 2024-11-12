<#
.SYNOPSIS
Sets the properties of a CIPP user.

.DESCRIPTION
The Set-CIPPUser function is used to set the properties of a CIPP user. It allows you to modify various user attributes such as display name, username, first name, last name, domain, aliases, usage location, department, city, country, job title, mobile phone, street address, postal code, company name, and more. You can also add or remove the user from groups.

.PARAMETER CustomerTenantID
The ID of the customer tenant to which the user belongs. This parameter is mandatory.

.PARAMETER UserID
The ID of the user to be modified. This parameter is mandatory.

.PARAMETER DisplayName
The display name of the user.

.PARAMETER UserName
The username of the user.

.PARAMETER FirstName
The first name of the user.

.PARAMETER LastName
The last name of the user.

.PARAMETER Domain
The domain of the user.

.PARAMETER AddedAliases
Additional aliases for the user.

.PARAMETER CopyFrom
The ID of another user from which to copy the properties.

.PARAMETER UsageLocation
The usage location of the user.

.PARAMETER Department
The department of the user.

.PARAMETER City
The city of the user.

.PARAMETER Country
The country of the user.

.PARAMETER Jobtitle
The job title of the user.

.PARAMETER MobilePhone
The mobile phone number of the user.

.PARAMETER StreetAddress
The street address of the user.

.PARAMETER PostalCode
The postal code of the user.

.PARAMETER CompanyName
The company name of the user.

.PARAMETER MustChangePass
Specifies whether the user must change their password. Default value is $false.

.PARAMETER AddToGroups
An array of group IDs to which the user should be added.

.PARAMETER RemoveFromGroups
An array of group IDs from which the user should be removed.

.PARAMETER BusinessPhone
An array of business phone numbers for the user.

.EXAMPLE
Set-CIPPUser -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -UserID "user1" -DisplayName "John Doe" -UserName "johndoe" -FirstName "John" -LastName "Doe" -Domain "example.com" -UsageLocation "US" -Department "IT" -City "New York" -Country "USA" -Jobtitle "Developer" -MobilePhone "1234567890" -StreetAddress "123 Main St" -PostalCode "12345" -CompanyName "Example Inc" -MustChangePass $true -AddToGroups "group1", "group2" -RemoveFromGroups "group3" -BusinessPhone "9876543210"


#>
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
                    groupid   = $cippAddGroup.ID
                    groupName = $cippAddGroup.DisplayName
                    groupType = $CIPPAddGroup.calculatedGroupType
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
                    groupid   = $CIPPRemoveGroup.ID
                    groupName = $CIPPRemoveGroup.DisplayName
                    groupType = $CIPPRemoveGroup.calculatedGroupType
                }
                label = "$($CIPPRemoveGroup.DisplayName) - $($CIPPRemoveGroup.calculatedGroupType)"
            }
        }
    }

    $body = @{
        tenantID          = $CustomerTenantID
        UserID            = $UserID
        userPrincipalName = $UserName ? ($UserName + '@' + $Domain) : $existingUser.UserPrincipalName
        Username          = $UserName ? $UserName : $existingUser.UserName
        DisplayName       = $DisplayName ? $DisplayName : $existingUser.DisplayName
        Domain            = $Domain ? $Domain : $existingUser.primDomain
        firstName         = $FirstName ? $FirstName : $existingUser.GivenName
        LastName          = $LastName ? $LastName : $existingUser.surname
        Jobtitle          = $Jobtitle ? $Jobtitle : $existingUser.Jobtitle
        usageLocation     = $UsageLocation ? $UsageLocation : $existingUser.UsageLocation
        BusinessPhone     = if ($BusinessPhone.Count -eq 0) { 
            $existingUser.BusinessPhones 
        } else { 
            $BusinessPhone 
        }
        AddToGroups       = $GroupsToAdd
        RemoveFromGroups  = $GroupsToRemove
        CopyFrom          = $CopyFrom
        Country           = $Country ? $Country : $existingUser.Country
        PostalCode        = $PostalCode ? $PostalCode : $existingUser.PostalCode
        CompanyName       = $CompanyName ? $CompanyName : $existingUser.CompanyName
        StreetAddress     = $StreetAddress ? $StreetAddress : $existingUser.StreetAddress
        MobilePhone       = $MobilePhone ? $MobilePhone : $existingUser.MobilePhone
        Department        = $Department ? $Department : $existingUser.Department
        City              = $City ? $City : $existingUser.City
        MustChangePass    = $MustChangePass
    }

    Invoke-CIPPRestMethod -Endpoint '/api/edituser' -Body $body -Method 'POST'
}
