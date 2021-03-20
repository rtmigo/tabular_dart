![Generic badge](https://img.shields.io/badge/status-draft-red.svg)
![Generic badge](https://img.shields.io/badge/tested_on-VM_|_JS-blue.svg)
[![Actions Status](https://github.com/rtmigo/tabular/workflows/unittest/badge.svg?branch=master)](https://github.com/rtmigo/tabular/actions)

# [Tabular](https://github.com/rtmigo/tabular)

`tabular` converts a Dart list to a Markdown table.

It is similar to python's [tabulate](https://pypi.org/project/tabulate/) 
or [pretty_table](https://pypi.org/project/prettytable/). But the Tabular is made directly to create tables in the Markdown format that Github understands.

----

 

``` dart
  var data = [
    ['Season', '#', 'Name', 'Days', 'Sun'],
    ['Winter', 1, 'January', 31, 94],
    ['Winter', 2, 'February', 28, 123],
    ['Spring', 3, 'March', 31, 42],
    ['Spring', 4, 'April', 30, 243],
    ['Spring', 5, 'May', 31, 5523],
    ['Summer', 6, 'June', 30, 11251],
    ['Summer', 7, 'July', 31, 17451],
    ['Summer', 8, 'August', 31, 18707],
    ['Autumn', 9, 'September', 30, 7025],
    ['Autumn', 10, 'October', 31, 5041],
    ['Autumn', 11, 'November', 30, 2302],
    ['Winter', 12, 'December', 31, 258],
  ];

  print(tabular(data));
```

``` text
| Season |  # | Name      | Days |   Sun |
|--------|----|-----------|------|-------|
| Winter |  1 | January   |   31 |    94 |
| Winter |  2 | February  |   28 |   123 |
| Spring |  3 | March     |   31 |    42 |
| Spring |  4 | April     |   30 |   243 |
| Spring |  5 | May       |   31 |  5523 |
| Summer |  6 | June      |   30 | 11251 |
| Summer |  7 | July      |   31 | 17451 |
| Summer |  8 | August    |   31 | 18707 |
| Autumn |  9 | September |   30 |  7025 |
| Autumn | 10 | October   |   31 |  5041 |
| Autumn | 11 | November  |   30 |  2302 |
| Winter | 12 | December  |   31 |   258 |
```

``` dart
print(tabular(data, markdownAlign: true));
```

``` text
| Season |  # | Name      | Days |   Sun |
|--------|---:|-----------|-----:|------:|
| Winter |  1 | January   |   31 |    94 |
| Winter |  2 | February  |   28 |   123 |
| Spring |  3 | March     |   31 |    42 |
| Spring |  4 | April     |   30 |   243 |
| Spring |  5 | May       |   31 |  5523 |
| Summer |  6 | June      |   30 | 11251 |
| Summer |  7 | July      |   31 | 17451 |
| Summer |  8 | August    |   31 | 18707 |
| Autumn |  9 | September |   30 |  7025 |
| Autumn | 10 | October   |   31 |  5041 |
| Autumn | 11 | November  |   30 |  2302 |
| Winter | 12 | December  |   31 |   258 |
```

### Sort alphabetically by column 0

``` dart
print(tabular(data, sort: [Sort(0)]));
```

``` text
| Season |  # | Name      | Days |   Sun |
|--------|----|-----------|------|-------|
| Autumn |  9 | September |   30 |  7025 |
| Autumn | 10 | October   |   31 |  5041 |
| Autumn | 11 | November  |   30 |  2302 |
| Spring |  3 | March     |   31 |    42 |
| Spring |  4 | April     |   30 |   243 |
| Spring |  5 | May       |   31 |  5523 |
| Summer |  6 | June      |   30 | 11251 |
| Summer |  7 | July      |   31 | 17451 |
| Summer |  8 | August    |   31 | 18707 |
| Winter |  1 | January   |   31 |    94 |
| Winter |  2 | February  |   28 |   123 |
| Winter | 12 | December  |   31 |   258 |
```
### Sort by 'Days' descending, and then by 'Name' ascending

``` dart
print(tabular(data, sort: [Sort('Days', false), Sort('Name')]));
```

``` text
| Season |  # | Name      | Days |   Sun |
|--------|----|-----------|------|-------|
| Summer |  8 | August    |   31 | 18707 |
| Winter | 12 | December  |   31 |   258 |
| Winter |  1 | January   |   31 |    94 |
| Summer |  7 | July      |   31 | 17451 |
| Spring |  3 | March     |   31 |    42 |
| Spring |  5 | May       |   31 |  5523 |
| Autumn | 10 | October   |   31 |  5041 |
| Spring |  4 | April     |   30 |   243 |
| Summer |  6 | June      |   30 | 11251 |
| Autumn | 11 | November  |   30 |  2302 |
| Autumn |  9 | September |   30 |  7025 |
| Winter |  2 | February  |   28 |   123 |
```


print(tabular(data, sort: [Sort(0)]));

# Formatting

The columns with numbers are automatically aligned to the right, 
the rest to the left

``` dart
final data = [
    ['Continent', 'Country', 'Islands', 'Population', 'Per island'],
    ['Europe', 'Norway', 55000, 5421241, 98.6],
    ['North America', 'Canada', 52455, 37742154, 719.5],
    ['Asia', 'Indonesia', 17508, 273523615, 15622.8],
    ['Europe', 'Finland', 188000, 5540720, 29.5],
    ['Asia', 'Japan', 6853, 126476461, 18455.6],
    ['Europe', 'Sweden', 221800, 10099265, 45.5],
];

print(tabular(data));
```

``` text
| Continent     | Country   | Islands | Population | Per island |
|---------------|-----------|---------|------------|------------|
| Europe        | Norway    |   55000 |    5421241 |       98.6 |
| North America | Canada    |   52455 |   37742154 |      719.5 |
| Asia          | Indonesia |   17508 |  273523615 |    15622.8 |
| Europe        | Finland   |  188000 |    5540720 |       29.5 |
| Asia          | Japan     |    6853 |  126476461 |    18455.6 |
| Europe        | Sweden    |  221800 |   10099265 |       45.5 |
```

`markdownAlign` adds `':'` to the aligned columns.

``` dart
print(tabular(data, markdownAlign: true));
```

``` text
| Continent     | Country   | Islands | Population | Per island |
|---------------|-----------|--------:|-----------:|-----------:|
| Europe        | Norway    |   55000 |    5421241 |       98.6 |
| North America | Canada    |   52455 |   37742154 |      719.5 |
| Asia          | Indonesia |   17508 |  273523615 |    15622.8 |
| Europe        | Finland   |  188000 |    5540720 |       29.5 |
| Asia          | Japan     |    6853 |  126476461 |    18455.6 |
| Europe        | Sweden    |  221800 |   10099265 |       45.5 |
```

# Sorting

## Sorting

By column index
``` dart
print(tabular(data, sort: [Sort(4)])); // 4th is "Per island"
```

Or by column name
``` dart
print(tabular(data, sort: [Sort('Per island')])); // "Per island" is 4th
```
Output
``` text
| Continent     | Country   | Islands | Population | Per island |
|---------------|-----------|---------|------------|------------|
| Europe        | Finland   |  188000 |    5540720 |       29.5 |
| Europe        | Sweden    |  221800 |   10099265 |       45.5 |
| Europe        | Norway    |   55000 |    5421241 |       98.6 |
| North America | Canada    |   52455 |   37742154 |      719.5 |
| Asia          | Indonesia |   17508 |  273523615 |    15622.8 |
| Asia          | Japan     |    6853 |  126476461 |    18455.6 |
```

Sorting by two columns

``` dart
print(tabular(data, sort: [Sort(0), Sort(1)]));
```

``` test
| Continent     | Country   | Islands | Population | Per island |
|---------------|-----------|---------|------------|------------|
| Asia          | Indonesia |   17508 |  273523615 |    15622.8 |
| Asia          | Japan     |    6853 |  126476461 |    18455.6 |
| Europe        | Finland   |  188000 |    5540720 |       29.5 |
| Europe        | Norway    |   55000 |    5421241 |       98.6 |
| Europe        | Sweden    |  221800 |   10099265 |       45.5 |
| North America | Canada    |   52455 |   37742154 |      719.5 |
```