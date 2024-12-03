<#
.SYNOPSIS
    Retrieves the extension mapping for a specified extension name.

.DESCRIPTION
    The Get-CIPPExtensionMapping function calls an API endpoint to get the extension mapping for a given extension name.
    The function supports the following extension names: "HaloPSA", "NinjaOne", "NinjaOneFields", "Hudu", and "HuduFields".

.PARAMETER ExtensionName
    The name of the extension for which to retrieve the mapping. This parameter is mandatory and accepts the following values:
    "HaloPSA", "NinjaOne", "NinjaOneFields", "Hudu", "HuduFields".

.EXAMPLE
    PS C:\> Get-CIPPExtensionMapping -ExtensionName "HaloPSA"
    This example retrieves the extension mapping for the "HaloPSA" extension.

.NOTES
    This function uses the Invoke-CIPPRestMethod cmdlet to call the API endpoint.
#>
function Get-CIPPExtensionMapping {
    [CmdletBinding()]
    Param(
    [Parameter(Mandatory = $true)]
    [ValidateSet(
        "HaloPSA", 
        "NinjaOne", 
        "NinjaOneFields", 
        "Hudu", 
        "HuduFields")]
    [string]$ExtensionName
)

    Write-Verbose 'Getting Extension Mapping'

    $endpoint = '/api/ExecExtensionMapping'
    $params = @{
        List = $ExtensionName
    }

    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}
