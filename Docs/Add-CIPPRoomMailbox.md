# Add-CIPPRoomMailbox
## SYNOPSIS
Adds a room mailbox to a specified tenant.
## DESCRIPTION
This function adds a room mailbox to a specified tenant by calling the CIPP API endpoint '/api/AddRoomMailbox'.
It requires the tenant ID, display name, domain, and username as mandatory parameters.
Optionally, the resource capacity can also be specified.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant where the room mailbox will be added. Either TenantID or Default domain can be used to identify the tenant.

  ## **-DisplayName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The display name for the room mailbox.

  ## **-Domain**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The domain for the room mailbox.

  ## **-Username**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The username for the room mailbox.

  ## **-ResourceCapacity**
> ![Foo](https://img.shields.io/badge/Type-Int32-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-0-Blue?color=5547a8)\
The resource capacity for the room mailbox. This parameter is optional.

 #### EXAMPLE 1
```powershell
P
>
 
A
d
d
-
R
o
o
m
M
a
i
l
b
o
x
 
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
7
e
3
e
f
f
b
6
-
6
e
f
e
-
4
2
f
2
-
b
0
7
1
-
4
8
c
e
3
1
8
e
a
f
9
5
"
 
-
D
i
s
p
l
a
y
N
a
m
e
 
"
C
o
n
f
e
r
e
n
c
e
 
R
o
o
m
 
1
"
 
-
D
o
m
a
i
n
 
"
e
x
a
m
p
l
e
.
c
o
m
"
 
-
U
s
e
r
n
a
m
e
 
"
c
o
n
f
r
o
o
m
1
"
 
-
R
e
s
o
u
r
c
e
C
a
p
a
c
i
t
y
 
1
0
```

