![Generic badge](https://img.shields.io/badge/status-it_works-green.svg)
![Generic badge](https://img.shields.io/badge/testing_on-VM_|_JS-blue.svg)
[![pub points](https://badges.bar/tabular/pub%20points)](https://pub.dev/packages/tabular/score)
[![Actions Status](https://github.com/rtmigo/tabular/workflows/unittest/badge.svg?branch=master)](https://github.com/rtmigo/tabular/actions)

# [Tabular](https://github.com/rtmigo/tabular)

Dart library for easily displaying tabular data in a visually appealing 
ASCII table format.

Tabular is specifically designed to create tables in the Markdown format that 
GitHub understands.

The library is inspired by python's [tabulate](https://pypi.org/project/tabulate/) 
and [pretty_table](https://pypi.org/project/prettytable/). 

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

var string = tabular(data);

print(string);
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


# Formatting

### Add border

``` dart
tabular(data, outerBorder: true);
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

### Add markdown ':' alignment marks

``` dart
tabular(data, markdownAlign: true)
```

``` text
Season |  # | Name      | Days |   Sun
-------|---:|-----------|-----:|-----:
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

# Sorting

### Sort alphabetically by column 0

``` dart
tabular(data, sort: [Sort(0)]) // 0 is 'Season'
```

``` text
Season |  # | Name      | Days |   Sun
-------|----|-----------|------|------
Autumn |  9 | September |   30 |  7025
Autumn | 10 | October   |   31 |  5041
Autumn | 11 | November  |   30 |  2302
Spring |  3 | March     |   31 |    42
Spring |  4 | April     |   30 |   243
Spring |  5 | May       |   31 |  5523
Summer |  6 | June      |   30 | 11251
Summer |  7 | July      |   31 | 17451
Summer |  8 | August    |   31 | 18707
Winter |  1 | January   |   31 |    94
Winter |  2 | February  |   28 |   123
Winter | 12 | December  |   31 |   258
```
### Sort by 'Days' descending, and then by 'Sun' ascending

``` dart
tabular(data, sort: [Sort('Days', ascending: false), Sort('Sun')])
```

``` text
Season |  # | Name      | Days |   Sun
-------|----|-----------|------|------
Spring |  3 | March     |   31 |    42
Winter |  1 | January   |   31 |    94
Winter | 12 | December  |   31 |   258
Autumn | 10 | October   |   31 |  5041
Spring |  5 | May       |   31 |  5523
Summer |  7 | July      |   31 | 17451
Summer |  8 | August    |   31 | 18707
Spring |  4 | April     |   30 |   243
Autumn | 11 | November  |   30 |  2302
Autumn |  9 | September |   30 |  7025
Summer |  6 | June      |   30 | 11251
Winter |  2 | February  |   28 |   123
```

