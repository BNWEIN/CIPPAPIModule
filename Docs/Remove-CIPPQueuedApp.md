# Remove-CIPPQueuedApp
## SYNOPSIS
Removes an application from the CIPP application queue.
## DESCRIPTION
The Remove-CIPPQueuedApp function removes a specified application from the CIPP application queue. This is typically used to remove pending application deployments or installations.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the customer tenant where the operation will be performed. This parameter is mandatory for proper data isolation and multi-tenancy compliance.

  ## **-ApplicationId**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
Specifies the ID of the application to remove from the queue.

 #### EXAMPLE 1
```powershell
PS > Remove-CIPPQueuedApp -CustomerTenantID "12345678-1234-1234-1234-1234567890AB" -ApplicationId "98765432-4321-4321-4321-BA0987654321"
```

