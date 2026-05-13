# Invoke-CIPPPreFlightCheck
## SYNOPSIS
Performs necessary checks before making CIPP API calls.
## DESCRIPTION
The Invoke-CIPPPreFlightCheck function validates that all required CIPP API connection 
variables are set and ensures the authentication token is valid.

If the authentication token is missing or expired, it automatically attempts to reconnect 
to the CIPP API using the stored credentials.

This function is called before every API operation to ensure proper connectivity and 
token validity. Module update checks are performed during initialization via Set-CIPPAPIDetails.
# PARAMETERS

#### EXAMPLE 1
```powershell
PS > Invoke-CIPPPreFlightCheck

Performs credential validation and token refresh checks.
```

