function Set-CIPPMailboxPermissions {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory = $true)]
        [string]$CustomerTenantID,
        [Parameter(Mandatory = $true)]
        [string]$Userid,
        [Parameter(Mandatory = $false)]
        [array]$RemoveFullAccess = @(),
        [Parameter(Mandatory = $false)]
        [array]$AddFullAccessAutoMap = @(),
        [Parameter(Mandatory = $false)]
        [array]$AddFullAccessNoAutoMap = @(),
        [Parameter(Mandatory = $false)]
        [array]$AddSendAs = @(),
        [Parameter(Mandatory = $false)]
        [array]$RemoveSendAs = @(),
        [Parameter(Mandatory = $false)]
        [array]$AddSendOnBehalf = @(),
        [Parameter(Mandatory = $false)]
        [array]$RemoveSendOnBehalf = @()
    )

    function ConvertTo-FormattedArray {
        param (
            [array]$inputArray,
            [string]$labelPrefix
        )
        $formattedArray = @()
        foreach ($item in $inputArray) {
            $formattedArray += @{
                value = $item
                label = "$labelPrefix - $item"
            }
        }
        return $formattedArray
    }

    Write-Verbose "Editing Mailbox permissions for $Userid"

    $endpoint = "/api/execeditmailboxpermissions"
    $body = @{
        TenantFilter = $CustomerTenantID
        UserID = $Userid
        RemoveFullAccess = (ConvertTo-FormattedArray -inputArray $RemoveFullAccess -labelPrefix "Remove Full Access")
        AddFullAccess = (ConvertTo-FormattedArray -inputArray $AddFullAccessAutoMap -labelPrefix "Add Full Access AutoMap")
        AddFullAccessNoAutoMap = (ConvertTo-FormattedArray -inputArray $AddFullAccessNoAutoMap -labelPrefix "Add Full Access No AutoMap")
        AddSendAs = (ConvertTo-FormattedArray -inputArray $AddSendAs -labelPrefix "Add Send As")
        RemoveSendAs = (ConvertTo-FormattedArray -inputArray $RemoveSendAs -labelPrefix "Remove Send As")
        AddSendOnBehalf = (ConvertTo-FormattedArray -inputArray $AddSendOnBehalf -labelPrefix "Add Send On Behalf")
        RemoveSendOnBehalf = (ConvertTo-FormattedArray -inputArray $RemoveSendOnBehalf -labelPrefix "Remove Send On Behalf")
    }
    
    Invoke-CIPPRestMethod -Endpoint $endpoint -body $body -Method 'POST'
}
