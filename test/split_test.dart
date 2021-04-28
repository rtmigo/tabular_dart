// SPDX-FileCopyrightText: (c) 2021 Artёm IG <github.com/rtmigo>
// SPDX-License-Identifier: MIT

import 'package:tabular/tabular.dart';
import 'package:test/test.dart';

import 'common.dart';

void main() {
  test('default split', () {
    var t = tabular(sundata);

    expect(
        t.spaceToDot(),
        testTrim(''' 
      Season.|..#.|.Name......|.Days.|...Sun
      -------|----|-----------|------|------
      Winter.|..1.|.January...|...31.|....94
      Winter.|..2.|.February..|...28.|...123
      Spring.|..3.|.March.....|...31.|....42
      Spring.|..4.|.April.....|...30.|...243
      Spring.|..5.|.May.......|...31.|..5523
      Summer.|..6.|.June......|...30.|.11251
      Summer.|..7.|.July......|...31.|.17451
      Summer.|..8.|.August....|...31.|.18707
      Autumn.|..9.|.September.|...30.|..7025
      Autumn.|.10.|.October...|...31.|..5041
      Autumn.|.11.|.November..|...30.|..2302
      Winter.|.12.|.December..|...31.|...258
      '''
            .trim()
            .noSpaces()));
  });

  test('no split', () {
    var t = tabular(sundata, rowDividers: []);

    //print(t.spaceToDot());

    expect(
        t.spaceToDot(),
        testTrim(''' 
      Season.|..#.|.Name......|.Days.|...Sun
      Winter.|..1.|.January...|...31.|....94
      Winter.|..2.|.February..|...28.|...123
      Spring.|..3.|.March.....|...31.|....42
      Spring.|..4.|.April.....|...30.|...243
      Spring.|..5.|.May.......|...31.|..5523
      Summer.|..6.|.June......|...30.|.11251
      Summer.|..7.|.July......|...31.|.17451
      Summer.|..8.|.August....|...31.|.18707
      Autumn.|..9.|.September.|...30.|..7025
      Autumn.|.10.|.October...|...31.|..5041
      Autumn.|.11.|.November..|...30.|..2302
      Winter.|.12.|.December..|...31.|...258
      '''
            .trim()
            .noSpaces()));
  });

  test('multiple split', () {
    var t = tabular(sundata, rowDividers: [1, 3, 6, 9, 12]);

    //print(t.spaceToDot());

    expect(
        t.spaceToDot(),
        testTrim(''' 
      Season.|..#.|.Name......|.Days.|...Sun
      -------|----|-----------|------|------
      Winter.|..1.|.January...|...31.|....94
      Winter.|..2.|.February..|...28.|...123
      -------|----|-----------|------|------
      Spring.|..3.|.March.....|...31.|....42
      Spring.|..4.|.April.....|...30.|...243
      Spring.|..5.|.May.......|...31.|..5523
      -------|----|-----------|------|------
      Summer.|..6.|.June......|...30.|.11251
      Summer.|..7.|.July......|...31.|.17451
      Summer.|..8.|.August....|...31.|.18707
      -------|----|-----------|------|------
      Autumn.|..9.|.September.|...30.|..7025
      Autumn.|.10.|.October...|...31.|..5041
      Autumn.|.11.|.November..|...30.|..2302
      -------|----|-----------|------|------
      Winter.|.12.|.December..|...31.|...258
      '''
            .trim()
            .noSpaces()));
  });

  test('dividers with sorting', () {
    var t = tabular(sundata, rowDividers: [1, 3, 6, 9, 12], sort: [Sort('Sun')]);

    // rows order changed, divider positions unchanged

    expect(
        t.spaceToDot(),
        testTrim(''' 
      Season.|..#.|.Name......|.Days.|...Sun
      -------|----|-----------|------|------
      Spring.|..3.|.March.....|...31.|....42
      Winter.|..1.|.January...|...31.|....94
      -------|----|-----------|------|------
      Winter.|..2.|.February..|...28.|...123
      Spring.|..4.|.April.....|...30.|...243
      Winter.|.12.|.December..|...31.|...258
      -------|----|-----------|------|------
      Autumn.|.11.|.November..|...30.|..2302
      Autumn.|.10.|.October...|...31.|..5041
      Spring.|..5.|.May.......|...31.|..5523
      -------|----|-----------|------|------
      Autumn.|..9.|.September.|...30.|..7025
      Summer.|..6.|.June......|...30.|.11251
      Summer.|..7.|.July......|...31.|.17451
      -------|----|-----------|------|------
      Summer.|..8.|.August....|...31.|.18707
      '''
            .trim()
            .noSpaces()));
  });
}
