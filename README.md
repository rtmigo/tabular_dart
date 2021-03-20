![Generic badge](https://img.shields.io/badge/status-draft-red.svg)
![Generic badge](https://img.shields.io/badge/tested_on-VM_|_JS-blue.svg)
[![Actions Status](https://github.com/rtmigo/tabular/workflows/unittest/badge.svg?branch=master)](https://github.com/rtmigo/tabular/actions)

# [Tabular](https://github.com/rtmigo/tabular)

`tabular` converts a Dart list to a Markdown table.

It is similar to python's [tabulate](https://pypi.org/project/tabulate/) 
or [pretty_table](https://pypi.org/project/prettytable/). But the Tabular 
is specifically designed to create tables in the Markdown format that Github understands.

----


``` dart
import 'package:tabular/tabular.dart';

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

### Sort alphabetically by column 0

``` dart
print(tabular(data, sort: [Sort(0)])); // 0 is 'Season'
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
### Sort by 'Days' descending, and then by 'Sun' ascending

``` dart
print(tabular(data, sort: [Sort('Days', false), Sort('Sun')]));
```

``` text
| Season |  # | Name      | Days |   Sun |
|--------|----|-----------|------|-------|
| Spring |  3 | March     |   31 |    42 |
| Winter |  1 | January   |   31 |    94 |
| Winter | 12 | December  |   31 |   258 |
| Autumn | 10 | October   |   31 |  5041 |
| Spring |  5 | May       |   31 |  5523 |
| Summer |  7 | July      |   31 | 17451 |
| Summer |  8 | August    |   31 | 18707 |
| Spring |  4 | April     |   30 |   243 |
| Autumn | 11 | November  |   30 |  2302 |
| Autumn |  9 | September |   30 |  7025 |
| Summer |  6 | June      |   30 | 11251 |
| Winter |  2 | February  |   28 |   123 |
```

### Remove border

``` dart
print(tabular(data, outerBorder: false));
```



``` text
Season |  # | Name      | Days |   Sun
-------|----|-----------|------|------
Winter |  1 | January   |   31 |    94
Winter |  2 | February  |   28 |   123
Spring |  3 | March     |   31 |    42
Spring |  4 | April     |   30 |   243
Spring |  5 | May       |   31 |  5523
Summer |  6 | June      |   30 | 11251
Summer |  7 | July      |   31 | 17451
Summer |  8 | August    |   31 | 18707
Autumn |  9 | September |   30 |  7025
Autumn | 10 | October   |   31 |  5041
Autumn | 11 | November  |   30 |  2302
Winter | 12 | December  |   31 |   258
```

### Add markdown ':' alignment marks

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