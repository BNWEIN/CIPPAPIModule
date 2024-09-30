<#
.SYNOPSIS
This script retrieves a list of all tenants and their associated AutoPilot devices from the CIPP API.

.DESCRIPTION
The script prompts the user for the CIPP API URL, Client ID, Client Secret, and Tenant ID. It then imports the CIPPAPIModule and sets the API details using the provided credentials. The script retrieves a list of tenants and then fetches all AutoPilot devices for each tenant in parallel. The results are exported to a CSV file and opened automatically.

.PARAMETER CIPPAPIUrl
The URL of the CIPP API.

.PARAMETER CIPPClientID
The Client ID for accessing the CIPP API.

.PARAMETER CIPPClientSecret
The Client Secret for accessing the CIPP API.

.PARAMETER TenantId
The Tenant ID for which the details are to be retrieved.

.OUTPUTS
A CSV file containing the list of AutoPilot devices for all tenants.

.EXAMPLE
.\Get-AllTenants-AutoPilotDevices.ps1
Prompts the user for the necessary API details and retrieves the AutoPilot devices for all tenants, exporting the results to a CSV file.

.NOTES
- Ensure that the CIPPAPIModule is installed and available in the PowerShell module path.
- The script uses parallel processing to speed up the retrieval of AutoPilot devices.
- The output CSV file is saved in the TEMP directory with a filename format "AutoPilotDevicesyyyy-MM-dd.csv".
#>
$CIPPAPIUrl = Read-Host "Enter the CIPP API URL"
$CIPPClientID = Read-Host "Enter the CIPP API Client ID"
$CIPPClientSecret = Read-Host "Enter the CIPP API Client Secret"
$TenantId = Read-Host "Enter the Tenant ID"

Import-Module CIPPAPIModule
Set-CIPPAPIDetails -CIPPClientID $CIPPClientID -CIPPClientSecret $CIPPClientSecret -CIPPAPIUrl $CIPPAPIUrl -TenantId $TenantId

Write-Output "Getting List of tenants"
$tenantsList = Get-CIPPTenants
Write-Output "Getting all Devices - This can take a few minutes..."
$AllTenantAPDevices = $tenantsList.defaultDomainName | ForEach-Object -Parallel {
    Import-Module CIPPAPIModule
    Set-CIPPAPIDetails -TenantID $using:TenantId -CIPPClientID $using:CIPPClientID -CIPPClientSecret $using:CIPPClientSecret -CIPPAPIUrl $using:CIPPAPIUrl
    $tenant = $_
    Write-Host "The tenant is $tenant"
    $Devices = Get-CIPPAPDevices -CustomerTenantID $tenant
    foreach ($device in $Devices) {
        [PSCustomObject]@{
            Tenant = $tenant
            SerialNumber = $device.serialNumber
            manufacturer = $device.manufacturer
            model = $device.model
        }
    }
} -ThrottleLimit 5

if ($null -eq $AllTenantAPDevices) {
    exit
}

$filename = "AutoPilotDevices" + (Get-Date -Format "yyyy-MM-dd") + ".csv"
$filepath = "$env:TEMP\$($filename)"

$AllTenantAPDevices | Export-CSV -Path $filepath

Start-Process -FilePath $filepath