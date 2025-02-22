<#
.SYNOPSIS
Sets the extension mapping for HaloPSA in the CIPP system.

.DESCRIPTION
The Set-CIPPExtensionMappingHaloPSA function sets the extension mapping for HaloPSA by adding or updating the mapping for a specified tenant. It retrieves the current extension mappings, updates them with the provided Halo client information, and sends the updated mappings to the CIPP system via a REST API call.

.PARAMETER HaloClientID
The ID of the Halo client. This parameter is mandatory.

.PARAMETER HaloClientName
The name of the Halo client. This parameter is mandatory.

.PARAMETER TenantID
The ID of the tenant for which the extension mapping is being set. This parameter is mandatory.

.EXAMPLE
Set-CIPPExtensionMappingHaloPSA -HaloClientID "12345" -HaloClientName "ExampleClient" -TenantID "7174f39b-33c6-4226-a67b-67fc1f127ef5"
This example sets the extension mapping for the Halo client with ID "12345" and name "ExampleClient" for the tenant with ID "67890".

#>
function Set-CIPPExtensionMappingHaloPSA {
    [CmdletBinding()]
    Param(
    [Parameter(Mandatory = $true)]
    [string]$HaloClientID,
    [Parameter(Mandatory = $true)]
    [string]$HaloClientName,
    [Parameter(Mandatory = $true)]
    [string]$TenantID
)

    Write-Verbose 'Setting Extension Mapping'

    $endpoint = '/api/ExecExtensionMapping'
    $params = @{
        AddMapping = "HaloPSA"
    }

    $ExtensionMappings = Get-CIPPExtensionMapping -ExtensionName HaloPSA

    # Convert the JSON string to a PowerShell object
    $jsonObject = $ExtensionMappings.mappings

    # Convert the PSCustomObject to a hashtable for modification
    $jsonHashtable = @{}
    $jsonObject.PSObject.Properties | ForEach-Object {
        $jsonHashtable[$_.Name] = $_.Value
    }

    # Add the new key-value pair to the hashtable
    $jsonHashtable[$TenantID] = @{
        value = $HaloClientID
        label = $HaloClientName
    }

    # Convert the updated hashtable back to JSON
    $json = $jsonHashtable | ConvertTo-Json -Depth 10

    $output = $json | ConvertFrom-Json

    $Body = @{
        mappings = $output
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Body $Body -Method Post
}
