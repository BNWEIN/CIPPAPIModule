<#
.SYNOPSIS
    Invokes a REST method using the CIPP API.

.DESCRIPTION
    The Invoke-CIPPRestMethod function is used to send HTTP requests to the CIPP API. It supports various HTTP methods such as GET, POST, PUT, DELETE, etc. The function assembles the request parameters, including the endpoint, query parameters, request body, headers, and authorization token. It then sends the request using the Invoke-RestMethod cmdlet and returns the response.

.PARAMETER Endpoint
    The endpoint of the API to send the request to.

.PARAMETER Params
    Optional. A hashtable of query parameters to include in the request URL.

.PARAMETER Method
    Optional. The HTTP method to use for the request. The default value is 'GET'.

.PARAMETER Body
    Optional. A hashtable representing the request body. It will be converted to JSON before sending the request.

.PARAMETER ContentType
    Optional. The content type of the request body. The default value is 'application/json'.

.PARAMETER Authorization
    Optional. The authorization token to include in the request headers.

.EXAMPLE
    Invoke-CIPPRestMethod -Endpoint '/api/Listusers' -Method 'GET' -Params @{ 'tenantfilter' = '11c11ab1-527a-1d29-l92e-76413h012s76' }
    This example sends a GET request to the '/api/Listusers' endpoint with a query parameter 'tenantfilter' set to '11c11ab1-527a-1d29-l92e-76413h012s76'.

    Invoke-CIPPRestMethod -Endpoint '/api/ListMailboxPermissions' -Params @{ 'tenantfilter' = 'M365x72601982.onmicrosoft.com', 'userid' = '11c11ab1-527a-1d29-l92e-76413h012s76'}
    This example sends a GET request to the '/api/ListMailboxPermissions' endpoint with a query parameter 'tenantfilter' set to 'M365x72601982.onmicrosoft.com' and 'userid' set to '11c11ab1-527a-1d29-l92e-76413h012s76'

    Invoke-CIPPRestMethod -Endpoint '/api/adduser' -method 'POST' -Body @{ 'tenantID' = '11c11ab1-527a-1d29-l92e-76413h012s76';'DisplayName' = 'Test User';'UserName' = 'testuser';'AutoPassword' = $true;'FirstName' = 'Test';'LastName' = 'User';'Domain' = 'M365x72601982.onmicrosoft.com';'CopyFrom' = "" }
    This example sends a POST request to the '/api/adduser' endpoint with a Body 'tenantID' set to '11c11ab1-527a-1d29-l92e-76413h012s76' and 'DisplayName' set to 'Test User', 'UserName' set to 'testuser', 'AutoPassword' set to $true, 'FirstName' set to 'Test', 'LastName' set to 'User', 'Domain' set to 'M365x72601982.onmicrosoft.com'

.OUTPUTS
    The function returns the response received from the CIPP API.

.NOTES


.LINK
    https://docs.cipp.app/api-documentation/endpoints
    The official documentation for the CIPP API.
#>
function Invoke-CIPPRestMethod {
    param (
        [string]$Endpoint,
        [hashtable]$Params = @{},
        [string]$Method = 'GET',
        [hashtable]$Body = @{},
        [string]$ContentType = 'application/json',
        [string]$Authorization = $null
    )

    try {
        Invoke-CIPPPreFlightCheck
    } catch {
        Write-Error "$($_.Exception.Message)"
        break
    }

    $Headers = $script:AuthHeader
    # Assemble parameters
    $ParamCollection = [System.Web.HttpUtility]::ParseQueryString([String]::Empty)

    $Params.GetEnumerator() | ForEach-Object {
        $ParamCollection.Add($_.Key, $_.Value)
    }
    $Request = $ParamCollection.ToString()

    $UriBuilder = [System.UriBuilder]('{0}{1}' -f $script:CIPPAPIUrl, $Endpoint)
    $UriBuilder.Query = $Request

    $BodyJson = $Body | ConvertTo-Json -Depth 10

    $Request = @{
        Uri         = $UriBuilder.ToString()
        Method      = $Method
        Headers     = $Headers
        ContentType = $ContentType
        Body        = $BodyJson
    }
    Write-Verbose "$Method [ $($UriBuilder.ToString()) ]"
    
    $response = Invoke-RestMethod @Request -ConnectionTimeoutSeconds 600
    return $response

}