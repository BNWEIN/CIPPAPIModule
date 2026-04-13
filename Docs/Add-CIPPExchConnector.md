# Add-CIPPExchConnector
## SYNOPSIS
Adds an Exchange Connector for a specified tenant using a template.
## DESCRIPTION
The Add-CIPPExchConnector function adds an Exchange Connector for a specified tenant using either a template GUID or template name. 
If neither the TemplateGuid nor TemplateName is provided, an error is thrown. The function retrieves the template, converts it to JSON, 
and sends a POST request to the '/api/AddExConnector' endpoint with the necessary parameters.
# PARAMETERS

## **-CustomerTenantDefaultDomain**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-TRUE-Red?) \
The default domain of the customer tenant for which the Exchange Connector is being added. This parameter is mandatory.

  ## **-TemplateGuid**
> ![Foo](https://img.shields.io/badge/Type-Guid-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The GUID of the template to be used for adding the Exchange Connector. This parameter is optional.

  ## **-TemplateName**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The name of the template to be used for adding the Exchange Connector. This parameter is optional.

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
C
o
n
n
e
c
t
o
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
C
o
n
n
e
c
t
o
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

