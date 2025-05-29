# Set-CIPPUser
## SYNOPSIS
Sets the properties of a CIPP user.
## DESCRIPTION
The Set-CIPPUser function is used to set the properties of a CIPP user. It allows you to modify various user attributes such as display name, username, first name, last name, domain, aliases, usage location, department, city, country, job title, mobile phone, street address, postal code, company name, and more. You can also add or remove the user from groups.
# PARAMETERS

## **-CustomerTenantID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the customer tenant to which the user belongs. This parameter is mandatory.

  ## **-UserID**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The ID of the user to be modified. This parameter is mandatory.

  ## **-DisplayName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The display name of the user.

  ## **-UserName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The username of the user.

  ## **-FirstName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The first name of the user.

  ## **-LastName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The last name of the user.

  ## **-Domain**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The domain of the user.

  ## **-AddedAliases**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
Additional aliases for the user.

  ## **-CopyFrom**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The ID of another user from which to copy the properties.

  ## **-UsageLocation**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The usage location of the user.

  ## **-Department**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The department of the user.

  ## **-City**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The city of the user.

  ## **-Country**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The country of the user.

  ## **-Jobtitle**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The job title of the user.

  ## **-MobilePhone**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The mobile phone number of the user.

  ## **-StreetAddress**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The street address of the user.

  ## **-PostalCode**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The postal code of the user.

  ## **-CompanyName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The company name of the user.

  ## **-MustChangePass**
> ![Foo](https://img.shields.io/badge/Type-Boolean-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-False-Blue?color=5547a8)\
Specifies whether the user must change their password. Default value is $false.

  ## **-AddToGroups**
> ![Foo](https://img.shields.io/badge/Type-Guid[]-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-@()-Blue?color=5547a8)\
An array of group IDs to which the user should be added.

  ## **-RemoveFromGroups**
> ![Foo](https://img.shields.io/badge/Type-Guid[]-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-@()-Blue?color=5547a8)\
An array of group IDs from which the user should be removed.

  ## **-BusinessPhone**
> ![Foo](https://img.shields.io/badge/Type-Array-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) ![Foo](https://img.shields.io/badge/DefaultValue-@()-Blue?color=5547a8)\
An array of business phone numbers for the user.

 #### EXAMPLE 1
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
U
s
e
r
 
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
c
e
d
1
6
2
1
-
b
8
f
7
-
4
2
3
1
-
8
6
8
c
-
b
c
6
b
1
a
2
f
1
7
7
8
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
1
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
J
o
h
n
 
D
o
e
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
d
o
e
"
 
-
F
i
r
s
t
N
a
m
e
 
"
J
o
h
n
"
 
-
L
a
s
t
N
a
m
e
 
"
D
o
e
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
a
g
e
L
o
c
a
t
i
o
n
 
"
U
S
"
 
-
D
e
p
a
r
t
m
e
n
t
 
"
I
T
"
 
-
C
i
t
y
 
"
N
e
w
 
Y
o
r
k
"
 
-
C
o
u
n
t
r
y
 
"
U
S
A
"
 
-
J
o
b
t
i
t
l
e
 
"
D
e
v
e
l
o
p
e
r
"
 
-
M
o
b
i
l
e
P
h
o
n
e
 
"
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
"
 
-
S
t
r
e
e
t
A
d
d
r
e
s
s
 
"
1
2
3
 
M
a
i
n
 
S
t
"
 
-
P
o
s
t
a
l
C
o
d
e
 
"
1
2
3
4
5
"
 
-
C
o
m
p
a
n
y
N
a
m
e
 
"
E
x
a
m
p
l
e
 
I
n
c
"
 
-
M
u
s
t
C
h
a
n
g
e
P
a
s
s
 
$
t
r
u
e
 
-
A
d
d
T
o
G
r
o
u
p
s
 
"
g
r
o
u
p
1
"
,
 
"
g
r
o
u
p
2
"
 
-
R
e
m
o
v
e
F
r
o
m
G
r
o
u
p
s
 
"
g
r
o
u
p
3
"
 
-
B
u
s
i
n
e
s
s
P
h
o
n
e
 
"
9
8
7
6
5
4
3
2
1
0
"
```

