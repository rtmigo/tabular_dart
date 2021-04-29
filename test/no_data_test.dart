// SPDX-FileCopyrightText: (c) 2021 Artёm IG <github.com/rtmigo>
// SPDX-License-Identifier: MIT

import 'package:tabular/tabular.dart';
import 'package:test/test.dart';

import 'common.dart';

void main() {
  test('2x2', () {
    var t = tabular([
      ['header', 'other'],
      ['a', 'b']
    ]);

    //print(t.spaceToDot());

    expect(
        t.spaceToDot(),
        testTrim(''' 
          header.|.other
          -------|------
          a......|.b....
      '''
            .trim()
            .noSpaces()));
  });

  test('1x2 long header', () {
    var t = tabular([
      ['header'],
      ['a']
    ]);

    //print(t.spaceToDot());

    expect(
        t.spaceToDot(),
        testTrim(''' 
          header
          ------
          a.....
      '''
            .trim()
            .noSpaces()));
  });

  test('1x2 long header + vertical border', () {
    var t = tabular([
      ['header'],
      ['a']
    ], border: Border.vertical);

    //print(t.spaceToDot());

    expect(
        t.spaceToDot(),
        testTrim(''' 
          |.header.|
          |--------|
          |.a......|
      '''
            .trim()
            .noSpaces()));
  });

  test('1x2 long cell', () {
    var t = tabular([
      ['a'],
      ['cell']
    ]);

    //print(t.spaceToDot());

    expect(
        t.spaceToDot(),
        testTrim(''' 
          a...
          ----
          cell
      '''
            .trim()
            .noSpaces()));
  });

  test('1x2 cell=null', () {
    var t = tabular([
      ['a'],
      [null]
    ]);

    //print(t.spaceToDot());

    expect(
        t.spaceToDot(),
        testTrim(''' 
          a
          -
          .
      '''
            .trim()
            .noSpaces()));
  });

  test('1x2, but row empty', () {
    var t = tabular([
      ['a'],
      []
    ]);

    expect(
        t.spaceToDot(),
        testTrim(''' 
          a
          -
          .
      '''
            .trim()
            .noSpaces()));
  });

  test('1x2 both null', () {
    var t = tabular([
      [null],
      [null]
    ]);

    //print(t.spaceToDot());

    expect(
        t.spaceToDot(),
        testTrim(''' 
          .
          -
          .
      '''
            .trim()
            .noSpaces()));
  });

  test('1x1', () {
    var t = tabular([
      ['header']
    ]);

    //print(t.spaceToDot());

    expect(
        t.spaceToDot(),
        testTrim(''' 
          header
      '''
            .trim()
            .noSpaces()));
  });

  test('1x1 borders', () {
    var t = tabular([
      ['header']
    ], border: Border.all);

    //print(t.spaceToDot());

    expect(
        t.spaceToDot(),
        testTrim(''' 
          |--------|
          |.header.|
          |--------|
      '''
            .trim()
            .noSpaces()));
  });

  test('1x1 null borders', () {
    var t = tabular([
      [null]
    ], border: Border.all);

    //print(t.spaceToDot());

    expect(
        t.spaceToDot(),
        testTrim(''' 
          |---|
          |...|
          |---|
      '''
            .trim()
            .noSpaces()));
  });

  test('1x0', () {
    expect(() => tabular([[]], border: Border.all), throwsArgumentError);
    expect(() => tabular([[]]), throwsArgumentError);
    expect(() => tabular([]), throwsArgumentError);
  });
}
