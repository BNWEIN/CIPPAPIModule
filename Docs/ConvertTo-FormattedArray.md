# ConvertTo-FormattedArray
## SYNOPSIS
Converts an input array into a formatted array with labels.
## DESCRIPTION
The ConvertTo-FormattedArray function takes an input array and a label prefix as parameters. It iterates through each item in the input array and creates a formatted array with labels. Each item in the formatted array is a hashtable with two properties: 'value' and 'label'. The 'value' property contains the original item from the input array, and the 'label' property contains the concatenation of the label prefix and the item.
# PARAMETERS

## **-inputArray**
> ![Foo](https://img.shields.io/badge/Type-Array-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The input array to be converted into a formatted array.

  ## **-labelPrefix**
> ![Foo](https://img.shields.io/badge/Type-String-Blue?) ![Foo](https://img.shields.io/badge/Mandatory-FALSE-Green?) \
The prefix to be added to each item in the formatted array as a label.

 #### EXAMPLE 1
```powershell
PS > $inputArray = 1, 2, 3



This example will convert the input array [1, 2, 3] into a formatted array with labels. The resulting formatted array will be:
[
@{
value = 1
label = "Item - 1"
},
@{
value = 2
label = "Item - 2"
},
@{
value = 3
label = "Item - 3"
}
]
```

