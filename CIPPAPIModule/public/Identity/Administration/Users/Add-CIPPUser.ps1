<#
.SYNOPSIS
Adds a user to the specified customer tenant.

.DESCRIPTION
The Add-CIPPUser function adds a user to the specified customer tenant in the CIPP system. It sends a request to the "/api/adduser" endpoint with the provided user details.

.PARAMETER CustomerTenantID
The ID of the customer tenant to which the user will be added.

.PARAMETER DisplayName
The display name of the user.

.PARAMETER UserName
The username of the user.

.PARAMETER AutoPassword
Specifies whether to automatically generate a password for the user. Default value is $true.

.PARAMETER FirstName
The first name of the user.

.PARAMETER LastName
The last name of the user.

.PARAMETER Domain
The domain of the user.

.PARAMETER AddedAliases
Additional aliases for the user.

.PARAMETER CopyFrom
Specifies the user to copy settings from.

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
Specifies whether the user must change their password on first login. Default value is $true.

.EXAMPLE
Add-CIPPUser -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -DisplayName "John Doe" -UserName "johndoe" -FirstName "John" -LastName "Doe" -Domain "example.com" -UsageLocation "US"

Adds a user with the specified details to the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778". The user's display name is "John Doe", username is "johndoe", first name is "John", last name is "Doe", domain is "example.com", and usage location is "US".

#>

function Add-CIPPUser {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$DisplayName,
        [Parameter(Mandatory = $true)]
        [string]$UserName,
        [Parameter(Mandatory = $false)]
        [bool]$AutoPassword = $true,
        [Parameter(Mandatory = $true)]
        [string]$FirstName,
        [Parameter(Mandatory = $true)]
        [string]$LastName,
        [Parameter(Mandatory = $true)]
        [string]$Domain,
        [Parameter(Mandatory = $false)]
        [string]$AddedAliases,
        [Parameter(Mandatory = $false)]
        [string]$CopyFrom,
        [Parameter(Mandatory = $true)]
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
        [bool]$MustChangePass = $true
    )

    Write-Verbose "Adding User to $CustomerTenantID"

    $endpoint = "/api/adduser"
    $body = @{
        tenantID = $CustomerTenantID
        DisplayName = $DisplayName
        UserName = $UserName
        AutoPassword = $AutoPassword
        FirstName = $FirstName
        LastName = $LastName
        Domain = $Domain
        AddedAliases = $AddedAliases
        CopyFrom = $CopyFrom
        Usagelocation = $UsageLocation
        MustChangePass = $MustChangePass
    }

    $optionalParams = @{
        Country = $Country
        PostalCode = $PostalCode
        CompanyName = $CompanyName
        StreetAddress = $StreetAddress
        MobilePhone = $MobilePhone
        Jobtitle = $Jobtitle
        Department = $Department
        City = $City
    }

    foreach ($key in $optionalParams.Keys) {
        if ($optionalParams[$key]) {
            $body[$key] = $optionalParams[$key]
        }
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method 'POST'
}
