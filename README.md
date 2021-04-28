# [Tabular](https://github.com/rtmigo/tabular_dart#tabular)

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

## Modify alignment

``` dart
tabular(data, align: {'Name': Side.center, 'Sun': Side.start})
```

``` text
Season |  # |    Name   | Days | Sun  
-------|----|-----------|------|------
Winter |  1 |  January  |   31 | 94   
Winter |  2 |  February |   28 | 123  
Spring |  3 |   March   |   31 | 42   
Spring |  4 |   April   |   30 | 243  
Spring |  5 |    May    |   31 | 5523 
Summer |  6 |    June   |   30 | 11251
Summer |  7 |   July    |   31 | 17451
Summer |  8 |   August  |   31 | 18707
Autumn |  9 | September |   30 | 7025 
Autumn | 10 |  October  |   31 | 5041 
Autumn | 11 | November  |   30 | 2302 
Winter | 12 |  December |   31 | 258  
```

## Add markdown ':' alignment marks

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

## Add vertical border

``` dart
tabular(data, border: Border.vertical);
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

Keep in mind that only vertical borders are part of Markdown. You can add 
horizontal, but then GitHub will not see it as part of the table.

## Switch border style

``` dart
tabular(data, style: Style.mysql, border: Border.all)
```

``` text
+--------+----+-----------+------+-------+
| Season |  # | Name      | Days |   Sun |
+--------+----+-----------+------+-------+
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
+--------+----+-----------+------+-------+
```

## Add horizontal dividers

``` dart
tabular(data, rowDividers: [1, 3, 6, 9, 12])
```

``` text
Season |  # | Name      | Days |   Sun
-------|----|-----------|------|------
Winter |  1 | January   |   31 |    94
Winter |  2 | February  |   28 |   123
-------|----|-----------|------|------
Spring |  3 | March     |   31 |    42
Spring |  4 | April     |   30 |   243
Spring |  5 | May       |   31 |  5523
-------|----|-----------|------|------
Summer |  6 | June      |   30 | 11251
Summer |  7 | July      |   31 | 17451
Summer |  8 | August    |   31 | 18707
-------|----|-----------|------|------
Autumn |  9 | September |   30 |  7025
Autumn | 10 | October   |   31 |  5041
Autumn | 11 | November  |   30 |  2302
-------|----|-----------|------|------
Winter | 12 | December  |   31 |   258
```

Keep in mind that additional dividers may not be recognized as a correct Markdown.


## Custom column formatting

``` dart
tabular(data, 
    format: {
        'Name': (value) => value.toUpperCase(), 
        'Sun': (value) => '+ '+value.toString() })
```

``` text
Season |  # | Name      | Days |     Sun
-------|----|-----------|------|--------
Winter |  1 | JANUARY   |   31 |    + 94
Winter |  2 | FEBRUARY  |   28 |   + 123
Spring |  3 | MARCH     |   31 |    + 42
Spring |  4 | APRIL     |   30 |   + 243
Spring |  5 | MAY       |   31 |  + 5523
Summer |  6 | JUNE      |   30 | + 11251
Summer |  7 | JULY      |   31 | + 17451
Summer |  8 | AUGUST    |   31 | + 18707
Autumn |  9 | SEPTEMBER |   30 |  + 7025
Autumn | 10 | OCTOBER   |   31 |  + 5041
Autumn | 11 | NOVEMBER  |   30 |  + 2302
Winter | 12 | DECEMBER  |   31 |   + 258
```



# Sorting

## Sort alphabetically by column 0

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

## Sort by 'Days' descending, and then by 'Sun' ascending

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

## Sort with custom comparison

Ordering the rows by the length of the month name.

``` dart
tabular(data, 
    sort: [Sort('Name', compare: (a, b) => a.length.compareTo(b.length))])
```

``` text
Season |  # | Name      | Days |   Sun
-------|----|-----------|------|------
Spring |  5 | May       |   31 |  5523
Summer |  6 | June      |   30 | 11251
Summer |  7 | July      |   31 | 17451
Spring |  3 | March     |   31 |    42
Spring |  4 | April     |   30 |   243
Summer |  8 | August    |   31 | 18707
Winter |  1 | January   |   31 |    94
Autumn | 10 | October   |   31 |  5041
Winter |  2 | February  |   28 |   123
Autumn | 11 | November  |   30 |  2302
Winter | 12 | December  |   31 |   258
Autumn |  9 | September |   30 |  7025
```