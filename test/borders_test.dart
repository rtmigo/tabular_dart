// SPDX-FileCopyrightText: (c) 2021 Artёm IG <github.com/rtmigo>
// SPDX-License-Identifier: MIT

import 'package:tabular/tabular.dart';
import 'package:test/test.dart';

import 'common.dart';

void main() {

  group('markdown', () {

    test('no border', () {
      var t = tabular(months);

      expect(t, testTrim(''' 
      Winter   | Spring | Summer | Autumn   
      ---------|--------|--------|----------
      December | March  | June   | September
      January  | April  | July   | October  
      February | May    | August | November 
        '''));
    });

    test('vertical border (default markdown)', () {
      var t = tabular(months, border: Border.vertical);

      //print(t);

      expect(t, testTrim(''' 
      | Winter   | Spring | Summer | Autumn    |
      |----------|--------|--------|-----------|
      | December | March  | June   | September |
      | January  | April  | July   | October   |
      | February | May    | August | November  |
        '''));
    });

    test('vertical border (deprecated outerBorder)', () {
      var t = tabular(months, outerBorder: true);

      //print(t);

      expect(t, testTrim(''' 
      | Winter   | Spring | Summer | Autumn    |
      |----------|--------|--------|-----------|
      | December | March  | June   | September |
      | January  | April  | July   | October   |
      | February | May    | August | November  |
        '''));
    });

    test('border horizontal (default markdown)', () {
      var t = tabular(months, border: Border.horizontal);

      //print(t);

      expect(t, testTrim(''' 
      ---------|--------|--------|----------
      Winter   | Spring | Summer | Autumn   
      ---------|--------|--------|----------
      December | March  | June   | September
      January  | April  | July   | October  
      February | May    | August | November 
      ---------|--------|--------|----------
      '''));
    });

    test('border all (default markdown)', () {
      var t = tabular(months, border: Border.all);

      expect(t, testTrim(''' 
      |----------|--------|--------|-----------|
      | Winter   | Spring | Summer | Autumn    |
      |----------|--------|--------|-----------|
      | December | March  | June   | September |
      | January  | April  | July   | October   |
      | February | May    | August | November  |
      |----------|--------|--------|-----------|
      '''));
    });
  });

  group('mysql', () {
    test('no border', () {
      var t = tabular(months, style: Style.mysql);
      //#print(t.spaceToDot());

      expect(t.spaceToDot(), ''' 
        Winter...|.Spring.|.Summer.|.Autumn...
        ---------+--------+--------+----------
        December.|.March..|.June...|.September
        January..|.April..|.July...|.October..
        February.|.May....|.August.|.November.
        '''.trim().noSpaces());
    });

    test('horizontal', () {
      var t = tabular(months, style: Style.mysql, border: Border.horizontal);
      //print(t.spaceToDot());

      expect(t.spaceToDot(), ''' 
        ---------+--------+--------+----------
        Winter...|.Spring.|.Summer.|.Autumn...
        ---------+--------+--------+----------
        December.|.March..|.June...|.September
        January..|.April..|.July...|.October..
        February.|.May....|.August.|.November.
        ---------+--------+--------+----------
        '''.trim().noSpaces());
    });

    test('vertical', () {
      var t = tabular(months, style: Style.mysql, border: Border.vertical);
      //print(t.spaceToDot());

      expect(t.spaceToDot(), ''' 
        |.Winter...|.Spring.|.Summer.|.Autumn....|
        +----------+--------+--------+-----------+
        |.December.|.March..|.June...|.September.|
        |.January..|.April..|.July...|.October...|
        |.February.|.May....|.August.|.November..|
        '''.trim().noSpaces());
    });

    test('all', () {
      var t = tabular(months, style: Style.mysql, border: Border.all);
      //print(t.spaceToDot());

      expect(t.spaceToDot(), ''' 
        +----------+--------+--------+-----------+
        |.Winter...|.Spring.|.Summer.|.Autumn....|
        +----------+--------+--------+-----------+
        |.December.|.March..|.June...|.September.|
        |.January..|.April..|.July...|.October...|
        |.February.|.May....|.August.|.November..|
        +----------+--------+--------+-----------+
        '''.trim().noSpaces());
    });
  });
}
