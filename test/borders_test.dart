// SPDX-FileCopyrightText: (c) 2021 Artёm IG <github.com/rtmigo>
// SPDX-License-Identifier: MIT

import 'package:tabular/tabular.dart';
import 'package:test/test.dart';

import 'common.dart';

void main() {

  var splitline_date = [
    ['Season', '#', 'Name', 'Days', 'Sun'],
    ['Winter', 12, 'December', 31, 258],
    ['Winter', 1, 'January', 31, 94],
    ['Winter', 2, 'February', 28, 123],
    split_line,
    ['Spring', 3, 'March', 31, 42],
    ['Spring', 4, 'April', 30, 243],
    ['Spring', 5, 'May', 31, 5523],
    split_line,
    ['Summer', 6, 'June', 30, 11251],
    ['Summer', 7, 'July', 31, 17451],
    ['Summer', 8, 'August', 31, 18707],
    split_line,
    ['Autumn', 9, 'September', 30, 7025],
    ['Autumn', 10, 'October', 31, 5041],
    ['Autumn', 11, 'November', 30, 2302],

  ];

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

    // test('all and split', () {
    //   var t = tabular(months, style: Style.mysql, border: Border.vertical);
    //   //print(t.spaceToDot());
    //
    //   expect(t.spaceToDot(), '''
    //     |.Winter...|.Spring.|.Summer.|.Autumn....|
    //     +----------+--------+--------+-----------+
    //     |.December.|.March..|.June...|.September.|
    //     |.January..|.April..|.July...|.October...|
    //     |.February.|.May....|.August.|.November..|
    //     '''.trim().noSpaces());
    // });

  });
}
