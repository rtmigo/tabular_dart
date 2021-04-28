// SPDX-FileCopyrightText: (c) 2021 Artsiom Galkin <github.com/rtmigo>
// SPDX-License-Identifier: MIT

import 'package:tabular/tabular.dart';
import 'package:test/test.dart';

import 'common.dart';

void main() {
  group('sorting numbers', () {

    test('by single index', () {
      final t = tabular(numbers, sort: [Sort(1)], outerBorder: true);
      //print(t);
      expect(t, testTrim(''' 
        | First | Second | Third |
        |-------|--------|-------|
        |   512 |     -1 |    37 |
        |    85 |     10 |    27 |
        |     5 |     10 |     3 |
        |     1 |     10 |   100 |
        |   512 |   2348 | 12037 |
        '''));
    });

    test('mixed types', () {

      // when choosing doubles, we avoid whole numbers (such as 1.0 or 5.0), because
      // in VM they are converted to string as "1.0" and "5.0", but in JS they are
      // converted as "1" and "5".

      final data = [['First', 'Second', 'Third'],
        [85, 10, 27],
        [512, 2348, null],
        [null, 10, 3],
        [511.1, -1, null],
        [1.1, 10, 100]];
      final t = tabular(data, sort: [Sort(0)], outerBorder: true);
      //print(t);
      expect(t, testTrim(''' 
        | First | Second | Third |
        |-------|--------|-------|
        |   1.1 |     10 |   100 |
        |    85 |     10 |    27 |
        | 511.1 |     -1 |       |
        |   512 |   2348 |       |
        |       |     10 |     3 |
        '''));
    });



    test('formatting does not change sorting', () {
      final t = tabular(numbers, sort: [Sort(1)], format: {1: (value)=>value==10 ? 'TEN' : value.toString()});
      //print(t);
      expect(t, testTrim(''' 
        First | Second | Third
        ------|--------|------
          512 |     -1 |    37
           85 |    TEN |    27
            5 |    TEN |     3
            1 |    TEN |   100
          512 |   2348 | 12037
        '''));
    });


    test('by indices [1, 0] [asc, asc]', () {
      final t = tabular(numbers, sort: [Sort(1), Sort(0)], outerBorder: true);
      //print(t);
      expect(t, testTrim('''
        | First | Second | Third |
        |-------|--------|-------|
        |   512 |     -1 |    37 |
        |     1 |     10 |   100 |
        |     5 |     10 |     3 |
        |    85 |     10 |    27 |
        |   512 |   2348 | 12037 |
        '''));
    });

    test('by indices [0, 1] [asc, asc]', () {
      final t = tabular(numbers, sort: [Sort(0), Sort(1)], outerBorder: true);
      //print(t);
      expect(t, testTrim('''
        | First | Second | Third |
        |-------|--------|-------|
        |     1 |     10 |   100 |
        |     5 |     10 |     3 |
        |    85 |     10 |    27 |
        |   512 |     -1 |    37 |
        |   512 |   2348 | 12037 |
        '''));
    });

    test('by two indices, asc-desc', () {
      final t = tabular(numbers, sort: [Sort(1, ascending: false), Sort(0)], outerBorder: true);
      expect(t, testTrim('''
        | First | Second | Third |
        |-------|--------|-------|
        |   512 |   2348 | 12037 |
        |     1 |     10 |   100 |
        |     5 |     10 |     3 |
        |    85 |     10 |    27 |
        |   512 |     -1 |    37 |
        '''));
    });

    test('by name, asc-desc', () {
      final t = tabular(numbers, sort: [Sort('Second', ascending: false), Sort('First')], outerBorder: true);
      //print(t);
      expect(t, testTrim('''
        | First | Second | Third |
        |-------|--------|-------|
        |   512 |   2348 | 12037 |
        |     1 |     10 |   100 |
        |     5 |     10 |     3 |
        |    85 |     10 |    27 |
        |   512 |     -1 |    37 |
        '''));
    });

    test('by name, asc-desc', () {
      final t = tabular(numbers, sort: [Sort('Second', ascending: false), Sort('First')], outerBorder: true);
      //print(t);
      expect(t, testTrim('''
        | First | Second | Third |
        |-------|--------|-------|
        |   512 |   2348 | 12037 |
        |     1 |     10 |   100 |
        |     5 |     10 |     3 |
        |    85 |     10 |    27 |
        |   512 |     -1 |    37 |
        '''));
    });

    test('sorting ascending empty last', () {

      final data = [
        ['First', 'Second', 'Third'],
        [40, 10, 27],
        [10, 2348, null],
        [null, 10, 3],
        [30, -1, null],
        [20, 10, 100],
        [null, 10, 100],
      ];

      final t = tabular(data, sort: [Sort(0)]);
      //print(t);
      expect(t, testTrim(''' 
        First | Second | Third
        ------|--------|------
           10 |   2348 |      
           20 |     10 |   100
           30 |     -1 |      
           40 |     10 |    27
              |     10 |     3
              |     10 |   100
        '''));
    });

    test('sorting ascending empty first', () {

      final data = [
        ['First', 'Second', 'Third'],
        [40, 10, 27],
        [10, 2348, null],
        [null, 10, 3],
        [30, -1, null],
        [20, 10, 100],
        [null, 10, 100],
      ];

      final t = tabular(data, sort: [Sort(0, emptyFirst: true)]);
      //print(t);
      expect(t, testTrim(''' 
        First | Second | Third
        ------|--------|------
              |     10 |     3
              |     10 |   100
           10 |   2348 |      
           20 |     10 |   100
           30 |     -1 |      
           40 |     10 |    27
        '''));
    });

    test('sorting descending empty first', () {

      final data = [
        ['First', 'Second', 'Third'],
        [40, 10, 27],
        [10, 2348, null],
        [null, 10, 3],
        [30, -1, null],
        [20, 10, 100],
        [null, 10, 100],
      ];

      final t = tabular(data, sort: [Sort(0, ascending: false, emptyFirst: true)]);
      //print(t);
      expect(t, testTrim(''' 
        First | Second | Third
        ------|--------|------
              |     10 |     3
              |     10 |   100
           40 |     10 |    27
           30 |     -1 |      
           20 |     10 |   100
           10 |   2348 |      
        '''));
    });

    test('custom comparison asc', () {
      final t = tabular(sundata, sort: [
        Sort(2, compare: (a,b)=>a.length.compareTo(b.length)),
        Sort(0),
      ]);
      // print(t);
      expect(t, testTrim(''' 
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
        '''));
    });

    test('custom comparison desc', () {
      final t = tabular(sundata, sort: [
        Sort(2, compare: (a,b)=>a.length.compareTo(b.length), ascending: false),
        Sort(0),
      ]);
      //print(t);
      expect(t, testTrim(''' 
        Season |  # | Name      | Days |   Sun
        -------|----|-----------|------|------
        Autumn |  9 | September |   30 |  7025
        Winter |  2 | February  |   28 |   123
        Autumn | 11 | November  |   30 |  2302
        Winter | 12 | December  |   31 |   258
        Winter |  1 | January   |   31 |    94
        Autumn | 10 | October   |   31 |  5041
        Summer |  8 | August    |   31 | 18707
        Spring |  3 | March     |   31 |    42
        Spring |  4 | April     |   30 |   243
        Summer |  6 | June      |   30 | 11251
        Summer |  7 | July      |   31 | 17451
        Spring |  5 | May       |   31 |  5523
        '''));
    });


  });
}
