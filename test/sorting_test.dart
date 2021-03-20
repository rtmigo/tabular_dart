// SPDX-FileCopyrightText: (c) 2021 Art Galkin <github.com/rtmigo>
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

  });
}
