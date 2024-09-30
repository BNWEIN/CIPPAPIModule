<#
.SYNOPSIS
Sets or gets the CIPP password settings.

.DESCRIPTION
The Set-CIPPPasswordSettings function is used to view the password settings for CIPP or to set them.

.PARAMETER Type
Specifies the type of password settings to be set. Valid values are "Correct-Battery-Horse" and "Classic".

.PARAMETER List
Specifies whether to list the current password settings. If set to $true, the function will retrieve the current password settings.

.EXAMPLE
Set-CIPPPasswordSettings -Type "Correct-Battery-Horse"
Sets the password settings to "Correct-Battery-Horse".

.EXAMPLE
Set-CIPPPasswordSettings -List $true
Lists the current password settings.

#>

function Set-CIPPPasswordSettings {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $false)]
        [ValidateSet(
            'Correct-Battery-Horse',
            'Classic'
        )]
        [string]$Type,
        [Parameter(Mandatory = $false)]
        [bool]$List
    )

    Write-Verbose 'Getting CIPP Password Settings'

    $endpoint = '/api/execpasswordconfig'

    if ($List) {
        $params = @{
            List = 'true'
        }
        Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
    } else {
        $body = @{
            passwordType = $Type
        }
        Invoke-CIPPRestMethod -Endpoint $endpoint -Body $body -Method 'POST'
    }
}