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
      expect(t, trimLR(''' 
        | First | Second | Third |
        |-------|--------|-------|
        |   512 |     -1 |    37 |
        |    85 |     10 |    27 |
        |     5 |     10 |     3 |
        |     1 |     10 |   100 |
        |   512 |   2348 | 12037 |
        '''));
    });

    test('by indices [1, 0] [asc, asc]', () {
      final t = tabular(numbers, sort: [Sort(1, true), Sort(0, true)], outerBorder: true);
      //print(t);
      expect(t, trimLR('''
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
      final t = tabular(numbers, sort: [Sort(0, true), Sort(1, true)], outerBorder: true);
      //print(t);
      expect(t, trimLR('''
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
      final t = tabular(numbers, sort: [Sort(1, false), Sort(0, true)], outerBorder: true);
      expect(t, trimLR('''
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
      final t = tabular(numbers, sort: [Sort('Second', false), Sort('First', true)], outerBorder: true);
      //print(t);
      expect(t, trimLR('''
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
      final t = tabular(numbers, sort: [Sort('Second', false), Sort('First', true)], outerBorder: true);
      //print(t);
      expect(t, trimLR('''
        | First | Second | Third |
        |-------|--------|-------|
        |   512 |   2348 | 12037 |
        |     1 |     10 |   100 |
        |     5 |     10 |     3 |
        |    85 |     10 |    27 |
        |   512 |     -1 |    37 |
        '''));
    });
  });
}
