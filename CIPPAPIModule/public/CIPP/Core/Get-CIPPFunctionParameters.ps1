<#
.SYNOPSIS
Retrieves the parameters of a CIPP function.

.DESCRIPTION
The Get-CIPPFunctionParameters function is used to retrieve the parameters of a CIPP function. It sends a request to the "/api/ListFunctionParameters" endpoint and returns the response.

.PARAMETER Module
Specifies the name of the module containing the function. This parameter is optional.

.PARAMETER Function
Specifies the name of the function. This parameter is optional.

.PARAMETER Compliance
Specifies whether to retrieve compliance-related parameters. This parameter is optional and defaults to $false.

.EXAMPLE
Get-CIPPFunctionParameters -Module "CIPPCore" -Function "Set-CIPPUserLicense"
Retrieves the compliance-related parameters of the specified function in the specified module.

.EXAMPLE
Get-CIPPFunctionParameters -Module "CIPPCore"
Retrieves all parameters of all functions in the specified module.

#>
function Get-CIPPFunctionParameters {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)]
        [string]$Module,
        [Parameter(Mandatory = $false)]
        [string]$Function,
        [parameter(Mandatory = $false)]
        [bool]$Compliance = $false
    )

    Write-Verbose "Getting Function Parameters"
    $Endpoint = "/api/ListFunctionParameters"

    $params = @{
        Module      = $Module
        Function    = $Function
        Compliance  = $Compliance
    }
    
    Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $params
}
