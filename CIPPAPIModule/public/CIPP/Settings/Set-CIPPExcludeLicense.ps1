<#
.SYNOPSIS
Sets the exclusion status of a license in CIPP.

.DESCRIPTION
The Set-CIPPExcludeLicense function is used to set the exclusion status of a license in CIPP. It allows you to add or remove a license from the exclusion list.

.PARAMETER LicenseGUID
Specifies the GUID of the license to be excluded or included.

.PARAMETER SKUName
Specifies the SKU name of the license.

.PARAMETER RemoveExclusion
Indicates whether to remove the license from the exclusion list. This switch cannot be used together with the -AddExclusion switch.

.PARAMETER AddExclusion
Indicates whether to add the license to the exclusion list. This switch cannot be used together with the -RemoveExclusion switch.

.EXAMPLE
Set-CIPPExcludeLicense -LicenseGUID "12345678-1234-1234-1234-1234567890AB" -SKUName "ExampleSKU" -RemoveExclusion
Removes the license with the specified GUID from the exclusion list.

.EXAMPLE
Set-CIPPExcludeLicense -LicenseGUID "12345678-1234-1234-1234-1234567890AB" -SKUName "ExampleSKU" -AddExclusion
Adds the license with the specified GUID to the exclusion list.

#>
function Set-CIPPExcludeLicense {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [guid]$LicenseGUID,
        [Parameter(Mandatory = $true)]
        [string]$SKUName,
        [Parameter()]
        [switch]$RemoveExclusion,
        [Parameter()]
        [switch]$AddExclusion
    )

    # Ensure only one of the switches is used
    if ($AddExclusion -and $RemoveExclusion) {
        throw "You cannot use both -AddExclusion and -RemoveExclusion switches at the same time."
    }

    if (-not $AddExclusion -and -not $RemoveExclusion) {
        throw "You must specify either -AddExclusion or -RemoveExclusion switch."
    }

    $endpoint = "/api/execexcludelicenses"
    
    if ($RemoveExclusion) {
        $params = @{
            GUID = $LicenseGUID
            RemoveExclusion = $true
        }
        Write-Verbose "Removing License $LicenseGUID from the exclusion list."
        Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
    } else {
        $params = @{
            AddExclusion = $true
        }
        $body = @{
            GUID = $LicenseGUID
            SKUName = $SKUName
        }
        Write-Verbose "Adding License $LicenseGUID to the exclusion list."
        Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params -Body $body -Method POST
    }
}
