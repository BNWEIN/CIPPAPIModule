# Add-CIPPRoomMailbox
## SYNOPSIS
Adds a room mailbox to a specified tenant.

## DESCRIPTION
This function adds a room mailbox to a specified tenant by calling the CIPP API endpoint '/api/AddRoomMailbox'.  
It requires the tenant ID, display name, domain, and username as mandatory parameters.  
Optionally, the resource capacity can also be specified.

# PARAMETERS

## **-CustomerTenantID**
![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?)  
The ID of the customer tenant where the room mailbox will be added. Either TenantID or Default domain can be used to identify the tenant.

## **-DisplayName**
![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?)  
The display name for the room mailbox.

## **-Domain**
![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?)  
The domain for the room mailbox.

## **-Username**
![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?)  
The username for the room mailbox.

## **-ResourceCapacity**
![Foo](https://img.shields.io/badge/Type-Int32-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-0-Blue?color=5547a8)  
The resource capacity for the room mailbox. This parameter is optional.

---

#### EXAMPLE 1

```powershell
Add-CIPPRoomMailbox -CustomerTenantID "7e3effb6-6efe-42f2-b071-48ce318eaf95" `
                    -DisplayName "Conference Room 1" `
                    -Domain "example.com" `
                    -Username "confroom1" `
                    -ResourceCapacity 10
