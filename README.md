## What is this?

This is the code for a [PowerShell](https://microsoft.com/powershell) module for [CIPP](https://cipp.app/). It is a work in progress, and only has about 80 out of the almost 300 API Endpoints built in. However, more will follow and it does have a generic 'Invoke-CIPPRestMethod' available so you can make any API call you want. See advanced usage examples below. 

The module is written for [PowerShell 7](https://docs.microsoft.com/en-us/powershell/scripting/whats-new/what-s-new-in-powershell-71?view=powershell-7.1). 

## What does it do?

CIPPAPIModule provides a PowerShell wrapper around the CIPP API. The module handles all the authentication for you. All you need to do is supply your CIPP API Details using the 'Set-CIPPAPIDetails' command.

## Installing

This module is published to the PowerShell Gallery and can be installed from within PowerShell with `Install-Module`

```powershell
Install-Module -Name CIPPAPIModule
```

## Getting Started

The first and probably most important requirement for this module is getting it connected to your CIPP API.


### Connecting the PowerShell module to the API

1. Set API Connection details
```powershell
Set-CIPPAPIDetails -CIPPClientID "YourCliendIDGoesHere" -CIPPClientSecret "YourClientSecretGoesHere" -CIPPAPIUrl "https://your.cipp.apiurl" -TenantID "YourTenantID"
```

2. Test your first call to the API
```powershell
Get-CIPPLogs
```

## Advanced Usage Examples

Below are some examples for some generic requests

```powershell
Invoke-CIPPRestMethod -Endpoint '/api/Listusers' -Method 'GET' -Params @{ 'tenantfilter' = '11c11ab1-527a-1d29-l92e-76413h012s76' }
```

This example sends a GET request to the '/api/Listusers' endpoint with a query parameter 'tenantfilter' set to '11c11ab1-527a-1d29-l92e-76413h012s76'.

```powershell
Invoke-CIPPRestMethod -Endpoint '/api/ListMailboxPermissions' -Params @{ 'tenantfilter' = 'M365x72601982.onmicrosoft.com', 'userid' = '11c11ab1-527a-1d29-l92e-76413h012s76'}
```

This example sends a GET request to the '/api/ListMailboxPermissions' endpoint with a query parameter 'tenantfilter' set to 'M365x72601982.onmicrosoft.com' and 'userid' set to '11c11ab1-527a-1d29-l92e-76413h012s76'

```powershell
Invoke-CIPPRestMethod -Endpoint '/api/adduser' -method 'POST' -Body @{ 'tenantID' = '11c11ab1-527a-1d29-l92e-76413h012s76';'DisplayName' = 'Test User';'UserName' = 'testuser';'AutoPassword' = $true;'FirstName' = 'Test';'LastName' = 'User';'Domain' = 'M365x72601982.onmicrosoft.com';'CopyFrom' = "" }
```

This example sends a POST request to the '/api/adduser' endpoint with a Body 'tenantID' set to '11c11ab1-527a-1d29-l92e-76413h012s76' and 'DisplayName' set to 'Test User', 'UserName' set to 'testuser', 'AutoPassword' set to $true, 'FirstName' set to 'Test', 'LastName' set to 'User', 'Domain' set to 'M365x72601982.onmicrosoft.com'

## Special Thanks

Special thanks to [@KelvinTegelaar](https://github.com/KelvinTegelaar/), [@JohnDuprey](https://github.com/JohnDuprey/), [@rvdwegen](https://github.com/rvdwegen) and [@Jr7468](https://github.com/Jr7468/).  I Could not have got this far without you! 