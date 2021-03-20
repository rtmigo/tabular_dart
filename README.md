![Generic badge](https://img.shields.io/badge/status-draft-red.svg)
![Generic badge](https://img.shields.io/badge/tested_on-VM_|_JS-blue.svg)
[![Actions Status](https://github.com/rtmigo/tabular/workflows/unittest/badge.svg?branch=master)](https://github.com/rtmigo/tabular/actions)

# [tabular](https://github.com/rtmigo/tabular)

Converts Dart lists to a Markdown table.

``` dart
print(tabular([
  ['Winter',    'Spring', 'Summer', 'Autumn'],
  ['December',  'March',  'June',   'September'],
  ['January',   'April',  'July',   'October'],
  ['February',  'May',    'August', 'November']
]));
```
``` text
| Winter   | Spring | Summer | Autumn    |
|----------|--------|--------|-----------|
| December | March  | June   | September |
| January  | April  | July   | October   |
| February | May    | August | November  |
```

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

# Sorting

### Sorting ascending

by column name:
``` dart
print(tabular(data, sort: [Sort('Per island')]));
```
or by column index:
``` dart
print(tabular(data, sort: [Sort(4)]));
```

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

### Sorting descending

``` dart
print(tabular(data, sort: [Sort('Per island', false)]));
```

``` text
| Continent     | Country   | Islands | Population | Per island |
|---------------|-----------|---------|------------|------------|
| Asia          | Japan     |    6853 |  126476461 |    18455.6 |
| Asia          | Indonesia |   17508 |  273523615 |    15622.8 |
| North America | Canada    |   52455 |   37742154 |      719.5 |
| Europe        | Norway    |   55000 |    5421241 |       98.6 |
| Europe        | Sweden    |  221800 |   10099265 |       45.5 |
| Europe        | Finland   |  188000 |    5540720 |       29.5 |
```

### Sorting by two columns
``` dart
print(tabular(data, sort: [Sort('Continent'), Sort('Country')]));
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