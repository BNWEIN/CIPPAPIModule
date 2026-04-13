# Add-CIPPExchTransportRule
## SYNOPSIS
Adds an Exchange Transport Rule for a specified tenant using a template.
## DESCRIPTION
The Add-CIPPExchTransportRule function adds an Exchange Transport Rule for a specified tenant using a template. 
The template can be specified either by its GUID or by its name. If neither is provided, an error is thrown.
# PARAMETERS

## **-CustomerTenantDefaultDomain**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The default domain of the customer tenant for which the transport rule is being added. This parameter is mandatory.

  ## **-TemplateGuid**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The GUID of the template to be used for creating the transport rule. This parameter is optional but either TemplateGuid or TemplateName must be provided.

  ## **-TemplateName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The name of the template to be used for creating the transport rule. This parameter is optional but either TemplateGuid or TemplateName must be provided.

 #### EXAMPLE 1
```powershell
P
>
 
A
d
d
-
C
I
P
P
E
x
c
h
T
r
a
n
s
p
o
r
t
R
u
l
e
 
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
D
e
f
a
u
l
t
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
T
e
m
p
l
a
t
e
G
u
i
d
 
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
```
 #### EXAMPLE 2
```powershell
P
>
 
A
d
d
-
C
I
P
P
E
x
c
h
T
r
a
n
s
p
o
r
t
R
u
l
e
 
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
D
e
f
a
u
l
t
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
T
e
m
p
l
a
t
e
N
a
m
e
 
"
D
e
f
a
u
l
t
T
e
m
p
l
a
t
e
"
```

