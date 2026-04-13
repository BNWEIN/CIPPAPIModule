# Get-CIPPAppRegistrations
## SYNOPSIS
Retrieves app registrations for a tenant.
## DESCRIPTION
Calls the CIPP ListGraphRequest API to return application registrations for a specified tenant. Defaults mirror the App Registrations UI (includes counts and returns up to 999 results).
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant to query.

 #### EXAMPLE 1
```powershell
P
>
 
G
e
t
-
C
I
P
P
A
p
p
R
e
g
i
s
t
r
a
t
i
o
n
s
 
-
C
u
s
t
o
m
e
r
T
e
n
a
n
t
I
D
 
"
c
o
n
t
o
s
o
.
o
n
m
i
c
r
o
s
o
f
t
.
c
o
m
"
```

