function Get-CIPPUniversalSearch {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$Name
        )
    
    Write-Verbose "Searching for $Name"

    $endpoint = "/api/execuniversalsearch"
    $params = @{
        name        = $Name
    }
    Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
}

