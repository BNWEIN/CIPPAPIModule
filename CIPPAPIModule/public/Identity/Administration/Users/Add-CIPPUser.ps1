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

.PARAMETER BusinessPhone
The business phone number of the user.

.PARAMETER StreetAddress
The street address of the user.

.PARAMETER PostalCode
The postal code of the user.

.PARAMETER CompanyName
The company name of the user.

.PARAMETER Manager
The manager of the user. Either the UserPrincipalName(UPN) or the ID of the manager.

.PARAMETER ScheduledFor
Specifies the date and time when the user should be added. If not specified, the user will be added immediately.
Input should be a valid datetime object. Will be converted to Unix time.

.PARAMETER SendResultsToEmail
Specifies whether to send the results of the scheduled task to the email address specified in the notification settings of your CIPP instance.

.PARAMETER SendResultsToPSA
Specifies whether to send the results of the scheduled task to the PSA system specified in the notification settings of your CIPP instance.

.PARAMETER SendResultsToWebhook
Specifies whether to send the results of the scheduled task to the webhook specified in the notification settings of your CIPP instance.

.PARAMETER MustChangePass
Specifies whether the user must change their password on first login. Default value is $true.

.EXAMPLE
Add-CIPPUser -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -DisplayName "John Doe" -UserName "johndoe" -FirstName "John" -LastName "Doe" -Domain "example.com" -UsageLocation "US"

Adds a user with the specified details to the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778". The user's display name is "John Doe", username is "johndoe", first name is "John", last name is "Doe", domain is "example.com", and usage location is "US".

.EXAMPLE
Add-CIPPUser -CustomerTenantID "7ced1621-b8f7-4231-868c-bc6b1a2f1778" -DisplayName "Jane Smith" -UserName "janesmith" -FirstName "Jane" -LastName "Smith" -Domain "example.com" -UsageLocation "US" -Manager "managerPerson@example.com" -ScheduledFor ((Get-Date).AddDays(1)) -SendResultsToEmail

Adds a user with the specified details to the customer tenant with ID "7ced1621-b8f7-4231-868c-bc6b1a2f1778". 
The user's display name is "Jane Smith", username is "janesmith", first name is "Jane", last name is "Smith", domain is "example.com", and usage location is "US". The user's manager is "managerPerson@example.com". 
The user will be added one day from the current date. The results of the scheduled task will be sent to the email address specified in the notification settings of your CIPP instance.

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
        [string]$BusinessPhone,
        [Parameter(Mandatory = $false)]
        [string]$StreetAddress,
        [Parameter(Mandatory = $false)]
        [string]$PostalCode,
        [Parameter(Mandatory = $false)]
        [string]$CompanyName,
        [Parameter(Mandatory = $false)]
        [string]$Manager,
        [Parameter(Mandatory = $false)]
        [bool]$MustChangePass = $true,
        [Parameter(Mandatory = $false)]
        [datetime]$ScheduledFor,
        [Parameter(Mandatory = $false)]
        [switch]$SendResultsToEmail,
        [Parameter(Mandatory = $false)]
        [switch]$SendResultsToPSA,
        [Parameter(Mandatory = $false)]
        [switch]$SendResultsToWebhook

    )

    Write-Verbose "Adding User to $CustomerTenantID"

    $endpoint = '/api/adduser'
    $body = @{
        tenantID       = $CustomerTenantID
        DisplayName    = $DisplayName
        UserName       = $UserName
        AutoPassword   = $AutoPassword
        FirstName      = $FirstName
        LastName       = $LastName
        Domain         = $Domain
        AddedAliases   = $AddedAliases
        CopyFrom       = $CopyFrom
        Usagelocation  = $UsageLocation
        MustChangePass = $MustChangePass

        
    }

    $optionalParams = @{
        Country       = $Country
        PostalCode    = $PostalCode
        CompanyName   = $CompanyName
        streetAddress = $StreetAddress
        MobilePhone   = $MobilePhone
        BusinessPhone = $BusinessPhone
        Jobtitle      = $Jobtitle
        Department    = $Department
        City          = $City
        setManager    = @{ value = $Manager }
        Scheduled     = @{
            enabled = $ScheduledFor -ne $null
            date    = if ($ScheduledFor) { ([System.DateTimeOffset]$ScheduledFor).ToUnixTimeSeconds() } else { $null }
        }
        PostExecution = @{
            webhook = if ($SendResultsToWebhook.IsPresent) { $true } else { $null }
            psa     = if ($SendResultsToPSA.IsPresent) { $true } else { $null }
            email   = if ($SendResultsToEmail.IsPresent) { $true } else { $null }
        }
    }

    # Add optional parameters to the body if they are not null
    foreach ($key in $optionalParams.Keys) {
        if ($optionalParams[$key]) {
            $body[$key] = $optionalParams[$key]
        }
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method 'POST'
}


<#
{
    "AddedAliases": "",
    "BusinessPhone": "98765432",
    "City": "aalborg",
    "CompanyName": "compela",
    "CopyFrom": "",
    "Country": "denmark",
    "Department": "IT",
    "DisplayName": "321 321 ",
    "Domain": "complea-it.dk",
    "FirstName": "321",
    "Jobtitle": "job",
    "LastName": "321",
    "MobilePhone": "12345678",
    "PostalCode": "0909",
    "Usagelocation": "DK",
    "Username": "321321",
    "streetAddress": "street",
    "Autopassword": false,
    "tenantID": "complea-it.dk",
    "setManager": {
        "value": "dad3057f-4003-423d-a721-22b9d3c17dd4",
        "label": "Com Full User 1"
    },
    "Scheduled": {
        "enabled": true,
        "date": 1727719200
    },
    "PostExecution": {
        "webhook": true,
        "psa": true,
        "email": true
    }
}

#>
