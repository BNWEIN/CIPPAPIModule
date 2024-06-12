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

