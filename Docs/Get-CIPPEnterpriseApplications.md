# Get-CIPPEnterpriseApplications
## SYNOPSIS
Retrieves enterprise applications (service principals) for a tenant.
## DESCRIPTION
Calls the CIPP ListGraphRequest API to return service principals for a specified tenant. Defaults match the Enterprise Applications UI (selects key fields, includes counts, returns up to 999 results).
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
E
n
t
e
r
p
r
i
s
e
A
p
p
l
i
c
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

