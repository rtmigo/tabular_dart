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
 print(tabular([
    ['Continent', 'Country', 'Islands', 'Population', 'Per island'],
    ['Europe', 'Sweden', 221800, 10099265, 45.5],
    ['Europe', 'Finland', 188000, 5540720, 29.5],
    ['Europe', 'Norway', 55000, 5421241, 98.6],
    ['North America', 'Canada', 52455, 37742154, 719.5],
    ['Asia', 'Indonesia', 17508, 273523615, 15622.8],
    ['Asia', 'Japan', 6853, 126476461, 18455.6],
  ]));
```

``` text
| Continent     | Country   | Islands | Population | Per island |
|---------------|-----------|---------|------------|------------|
| Europe        | Sweden    |  221800 |   10099265 |       45.5 |
| Europe        | Finland   |  188000 |    5540720 |       29.5 |
| Europe        | Norway    |   55000 |    5421241 |       98.6 |
| North America | Canada    |   52455 |   37742154 |      719.5 |
| Asia          | Indonesia |   17508 |  273523615 |    15622.8 |
| Asia          | Japan     |    6853 |  126476461 |    18455.6 |
```