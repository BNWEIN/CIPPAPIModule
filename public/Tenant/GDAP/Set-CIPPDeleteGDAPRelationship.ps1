function Set-CIPPDeleteGDAPRelationship {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$GDAPID
        )
    
    Write-Verbose "Terminating GDAP Relationship: $GDAPID"
    $Endpoint = "/api/execdeletegdaprelationship"
    $Params = @{
        gdapid = $GDAPID
    }
    
    Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params

}