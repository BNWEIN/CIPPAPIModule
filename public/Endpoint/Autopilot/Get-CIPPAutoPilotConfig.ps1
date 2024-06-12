function Get-CIPPAutoPilotConfig {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$Type
        )
    
    if ($Type -eq "ESP") {
        Write-Verbose "Getting AutoPilot Status Page for $CustomerTenantID"
    } elseif ($Type -eq "ApProfile"){
        Write-Verbose "Getting AutoPilot Profile for customer: $CustomerTenantID"
    }
        $Endpoint = "/api/listautopilotconfig"
        $Params = @{
            tenantfilter = $CustomerTenantID
            type = $Type
        }
        
        Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params
}

