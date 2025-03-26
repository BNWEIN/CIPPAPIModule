# New-CIPPTemporaryAccessPass
## SYNOPSIS
Creates a new Temporary Access Pass for a user in a Microsoft 365 tenant.
## DESCRIPTION
The New-CIPPTemporaryAccessPass function creates a Temporary Access Pass (TAP) for a specified user
in a given Microsoft 365 tenant. This provides temporary, time-limited access without requiring a
permanent password.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The tenant ID of the Microsoft 365 customer where the TAP will be created.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user for whom the TAP will be created.

 #### EXAMPLE 1
```powershell
P
>
 
N
e
w
-
C
I
P
P
T
e
m
p
o
r
a
r
y
A
c
c
e
s
s
P
a
s
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
 
-
U
s
e
r
I
D
 
"
u
s
e
r
@
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
 #### EXAMPLE 2
```powershell
P
>
 
N
e
w
-
C
I
P
P
T
e
m
p
o
r
a
r
y
A
c
c
e
s
s
P
a
s
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
1
a
2
b
3
c
4
d
-
1
2
3
4
-
1
2
3
4
-
1
2
3
4
-
1
a
2
b
3
c
4
d
5
e
6
f
"
 
-
U
s
e
r
I
D
 
"
1
a
2
b
3
c
4
d
-
1
2
3
4
-
1
2
3
4
-
1
2
3
4
-
1
a
2
b
3
c
4
d
5
e
6
f
"
```

