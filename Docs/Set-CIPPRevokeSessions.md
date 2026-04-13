# Revoke-CIPPUserSessions
## SYNOPSIS
Revokes all active sessions for a specified user.
## DESCRIPTION
The Revoke-CIPPUserSessions function terminates all active user sessions for a specified user in a given tenant.
This is useful for security incidents or when immediate account access revocation is needed.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The tenant ID of the customer where the user account is located.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The unique identifier (GUID) of the user whose sessions should be revoked.

  ## **-UserName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The username or display name of the user whose sessions should be revoked.

 #### EXAMPLE 1
```powershell
P
>
 
R
e
v
o
k
e
-
C
I
P
P
U
s
e
r
S
e
s
s
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
 
-
U
s
e
r
I
D
 
"
1
2
3
4
5
6
7
8
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
2
3
4
5
6
7
8
9
0
1
2
"
 
-
U
s
e
r
N
a
m
e
 
"
j
o
h
n
.
d
o
e
@
c
o
n
t
o
s
o
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
 
S
e
t
-
C
I
P
P
R
e
v
o
k
e
S
e
s
s
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
f
a
b
r
i
k
a
m
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
8
7
6
5
4
3
2
1
-
4
3
2
1
-
4
3
2
1
-
4
3
2
1
-
2
1
0
9
8
7
6
5
4
3
2
1
"
 
-
U
s
e
r
N
a
m
e
 
"
j
a
n
e
.
s
m
i
t
h
@
f
a
b
r
i
k
a
m
.
c
o
m
"
```

