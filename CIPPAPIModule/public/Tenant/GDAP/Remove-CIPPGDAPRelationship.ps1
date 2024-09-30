<#
.SYNOPSIS
Removes a GDAP (Global Data Access Point) relationship.

.DESCRIPTION
The Remove-CIPPGDAPRelationship function terminates a GDAP relationship by invoking a REST API endpoint.

.PARAMETER GDAPID
Specifies the ID of the GDAP relationship to be terminated.

.EXAMPLE
Remove-CIPPGDAPRelationship -GDAPID "59a6b837-2c8d-4f91-93e1-746cd82b1e37-a9d8b5e2-73cf-41a5-8de7-134f62b0c6e9"
Terminates the GDAP relationship with the ID "59a6b837-2c8d-4f91-93e1-746cd82b1e37-a9d8b5e2-73cf-41a5-8de7-134f62b0c6e9".

#>
function Remove-CIPPGDAPRelationship {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$GDAPID
    )

    Write-Verbose "Terminating GDAP Relationship: $GDAPID"
    $Endpoint = '/api/execdeletegdaprelationship'
    $Params = @{
        gdapid = $GDAPID
    }

    Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params

}