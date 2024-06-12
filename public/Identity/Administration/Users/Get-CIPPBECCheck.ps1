function Get-CIPPBECCheck {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$UserID,
            [Parameter(Mandatory = $true)]
            [string]$UserName

        )
    
        Write-Verbose "Running BEC Check for $Username"
    
        $endpoint = "/api/execbeccheck"
        $params = @{
        tenantfilter    = $CustomerTenantID
        userId          = $UserID
        username        = $UserName
    }

        $initialResponse = Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params
        $GUID = $initialResponse.guid

        Write-Verbose "Initial check complete. GUID returned: $GUID"
        $params.guid = $GUID

    do {
        Start-Sleep -Seconds 10
        $response = Invoke-CIPPRestMethod -Endpoint $endpoint -Params $params

        if ($response.waiting -eq "True") {
            Write-Verbose "BEC Check Still Running."
        } else {
            Write-Verbose "BEC Check complete"
            return $response
        }
    } while ($response.waiting -eq "True")
}

