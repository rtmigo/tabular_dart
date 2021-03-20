// SPDX-FileCopyrightText: (c) 2021 Art Galkin <github.com/rtmigo>
// SPDX-License-Identifier: MIT


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

    expect(trimR(t), trimR(''' 
Winter   | Spring | Summer | Autumn   
---------|--------|--------|----------
December | March  | June   | September
January  | April  | July   | October  
February | May    | August | November 
        '''));
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

    expect(trimR(t), trimR(''' 
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

    expect(trimR(t), trimR('''
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
