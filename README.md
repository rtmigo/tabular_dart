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
      ['First', 'Second', 'Third'],
      [85, 2, 27],
      [1414, 2348, 12037],
      [114, 248, 037],
      [1.1, 2.2, 3.3],
    ]);
```

``` text
| First | Second | Third |
|-------|--------|-------|
|    85 |      2 |    27 |
|  1414 |   2348 | 12037 |
|   114 |    248 |    37 |
|   1.1 |    2.2 |   3.3 |
```