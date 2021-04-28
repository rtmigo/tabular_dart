// SPDX-FileCopyrightText: (c) 2021 Artёm IG <github.com/rtmigo>
// SPDX-License-Identifier: MIT


//import 'package:tabular/src/inner.dart';
import 'package:tabular/tabular.dart';
import 'package:test/test.dart';

import 'common.dart';



void main() {
  test('strings', () {

    var t = tabular([
      ['Winter',    'Spring', 'Summer', 'Autumn'],
      ['December',  'March',  'June',   'September'],
      ['January',   'April',  'July',   'October'],
      ['February',  'May',    'August', 'November']
    ]);

    //print(t);

    expect(t, testTrim(''' 
      Winter   | Spring | Summer | Autumn   
      ---------|--------|--------|----------
      December | March  | June   | September
      January  | April  | July   | October  
      February | May    | August | November 
        '''));
  });

  test('override align', () {

    var t = tabular([
      ['Winter',    'Spring', 'Summer', 'Autumn'],
      ['December',  'March',  'June',   'September'],
      ['January',   'April',  'July',   'October'],
      ['February',  'May',    'August', 'November']
    ],
      align: {3: Side.end, 'Summer': Side.end},
    );

    //print(t);

    expect(t, testTrim(''' 
      Winter   | Spring | Summer |    Autumn
      ---------|--------|--------|----------
      December | March  |   June | September
      January  | April  |   July |   October
      February | May    | August |  November 
        '''.trimRight()));
  });

  test('center align', () {

    var t = tabular(sundata,
      align: {'Name': Side.center},
    );

    //print(t);

    expect(t, testTrim(''' 
      Season |  # |    Name   | Days |   Sun
      -------|----|-----------|------|------
      Winter |  1 |  January  |   31 |    94
      Winter |  2 |  February |   28 |   123
      Spring |  3 |   March   |   31 |    42
      Spring |  4 |   April   |   30 |   243
      Spring |  5 |    May    |   31 |  5523
      Summer |  6 |    June   |   30 | 11251
      Summer |  7 |   July    |   31 | 17451
      Summer |  8 |   August  |   31 | 18707
      Autumn |  9 | September |   30 |  7025
      Autumn | 10 |  October  |   31 |  5041
      Autumn | 11 | November  |   30 |  2302
      Winter | 12 |  December |   31 |   258
        '''.trimRight()));
  });

  test('formatter', () {

    var t = tabular([
      ['Winter',    'Spring', 'Summer', 'Autumn'],
      ['December',  'March',  'June',   'September'],
      ['January',   'April',  'July',   'October'],
      ['February',  'May',    'August', 'November']
    ],
      format: {'Spring': (val)=>(val as String).toUpperCase()},
    );

    //print(t);

    expect(t.trimRight(), testTrim(''' 
      Winter   | Spring | Summer | Autumn   
      ---------|--------|--------|----------
      December | MARCH  | June   | September
      January  | APRIL  | July   | October  
      February | MAY    | August | November
        '''.trimRight()));
  });



  test('digits auto right', () {
    var t = tabular([
      ['First', 'Second', 'Third'],
      [85, 2, 27],
      [1414, 2348, 12037],
      [114, 248, 037],
      [1.1, 2.2, 3.3],
    ]);

    //    print(t);

    expect(t, testTrim(''' 
      First | Second | Third
      ------|--------|------
         85 |      2 |    27
       1414 |   2348 | 12037
        114 |    248 |    37
        1.1 |    2.2 |   3.3
        '''));
  });


//  return;


  test('markdown align by guess', () {
    var t = tabular(numbers, markdownAlign: true);
    //print(t);

    expect(t, testTrim('''
First | Second | Third
-----:|-------:|-----:
   85 |     10 |    27
  512 |   2348 | 12037
    5 |     10 |     3
  512 |     -1 |    37
    1 |     10 |   100
'''));
  });

//  return;



  test('mixed', () {
    var t = tabular([
      ['First', 'Second', 'Third'],
      [85, 2, 27],
      [1414, '348', null],
      [666],
      [null, 777],
      [114, 248, 037],
      ['', 2, null],

    ]);

    //print(t);

    expect(trimR(t), trimR('''
First | Second | Third
------|--------|------
   85 |      2 |    27
 1414 |    348 |      
  666 |        |      
      |    777 |      
  114 |    248 |    37
      |      2 |      
        '''));
  });
}
