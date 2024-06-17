<#
.SYNOPSIS
Performs a Geo IP lookup for a given IP address.

.DESCRIPTION
The Get-CIPPExternalGEOIPLookup function performs a Geo IP lookup for a given IP address using a REST API. It retrieves information about the geographical location of the IP address.

.PARAMETER IP
Specifies the IP address for which the Geo IP lookup needs to be performed. The IP address can be in IPv4 or IPv6 format.

.EXAMPLE
Get-CIPPExternalGEOIPLookup -IP "8.8.8.8"
Performs a Geo IP lookup for the IP address "8.8.8.8".

.EXAMPLE
Get-CIPPExternalGEOIPLookup -IP "2001:0db8:85a3:0000:0000:8a2e:0370:7334"
Performs a Geo IP lookup for the IP address "2001:0db8:85a3:0000:0000:8a2e:0370:7334".

.INPUTS
None. You cannot pipe input to this function.

.OUTPUTS
System.Object. The function returns the result of the Geo IP lookup as an object.

.NOTES
This function requires the Invoke-CIPPRestMethod function to be available in the current session.

.LINK
Invoke-CIPPRestMethod
#>
function Get-CIPPExternalGEOIPLookup {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [ValidatePattern('^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$|^((([0-9A-Fa-f]{1,4}:){7}([0-9A-Fa-f]{1,4}|:))|(([0-9A-Fa-f]{1,4}:){1,7}:)|(([0-9A-Fa-f]{1,4}:){1,6}:[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){1,5}(:[0-9A-Fa-f]{1,4}){1,2})|(([0-9A-Fa-f]{1,4}:){1,4}(:[0-9A-Fa-f]{1,4}){1,3})|(([0-9A-Fa-f]{1,4}:){1,3}(:[0-9A-Fa-f]{1,4}){1,4})|(([0-9A-Fa-f]{1,4}:){1,2}(:[0-9A-Fa-f]{1,4}){1,5})|(([0-9A-Fa-f]{1,4}:):(:[0-9A-Fa-f]{1,4}){1,6})|(::([0-9A-Fa-f]{1,4}:){1,7}))$')]
        [string]$IP
    )
   
    Write-Verbose "Looking up $ip in Geo DB"
    $endpoint = "/api/execgeoiplookup"
    $params = @{
        ip = $IP
    }
    
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}