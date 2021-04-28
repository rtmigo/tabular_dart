// SPDX-FileCopyrightText: (c) 2021 Artёm IG <github.com/rtmigo>
// SPDX-License-Identifier: MIT

String trimLR(String s, {onlyRight = false}) {
  final strippedRows = s.split('\n').map((s) => onlyRight ? s.trimRight() : s.trim()).toList();
  while (strippedRows.isNotEmpty && strippedRows.first.isEmpty) {
    strippedRows.removeAt(0);
  }

  while (strippedRows.isNotEmpty && strippedRows.last.isEmpty) {
    strippedRows.removeLast();
  }

  return strippedRows.join('\n');
}

String trimR(String s) {
  return trimLR(s, onlyRight: true);
}

List<String> removeCommonBlanksAtLeft(List<String> lines) {
  while (!lines.any((element) => element.isEmpty)) {
    // while there are no empty lines (so they all have a first char)
    final firstCharSet = lines.map((str) => str[0]).toSet();
    if (firstCharSet.length == 1 && ['\t', ' '].contains(firstCharSet.first)) {
      // all the lines have exactly the same first char, and it's a blank.
      // Recreating the lines list with first char removed
      lines = lines.map((str) => str.substring(1)).toList();
      continue; // try again, maybe there are more blanks to remove
    }
    break; // there are no common blanks anymore
  }
  return lines;
}

String testTrim(String s) {
  var lines = s.split('\n');

  // removing empty lines at the beginning of the list
  while (lines.isNotEmpty && lines.first.trim().isEmpty) {
    lines.removeAt(0);
  }

  // removing empty lines at the end of the list
  while (lines.isNotEmpty && lines.last.trim().isEmpty) {
    lines.removeLast();
  }

  lines = removeCommonBlanksAtLeft(lines);

  return lines.join('\n');
}

extension TestExt on String {
  String spaceToDot() {
    return this.replaceAll(' ', '.');
  }

  String noSpaces() {
    return this.replaceAll('\t', '').replaceAll(' ', '');
  }
}

var sundata = [
  ['Season', '#', 'Name', 'Days', 'Sun'],
  ['Winter', 1, 'January', 31, 94],
  ['Winter', 2, 'February', 28, 123],
  ['Spring', 3, 'March', 31, 42],
  ['Spring', 4, 'April', 30, 243],
  ['Spring', 5, 'May', 31, 5523],
  ['Summer', 6, 'June', 30, 11251],
  ['Summer', 7, 'July', 31, 17451],
  ['Summer', 8, 'August', 31, 18707],
  ['Autumn', 9, 'September', 30, 7025],
  ['Autumn', 10, 'October', 31, 5041],
  ['Autumn', 11, 'November', 30, 2302],
  ['Winter', 12, 'December', 31, 258],
];

final zdata = [
  ['Continent', 'Country', 'Islands', 'Population', 'Per island'],
  ['Europe', 'Norway', 55000, 5421241, 98.6],
  ['North America', 'Canada', 52455, 37742154, 719.5],
  ['Asia', 'Indonesia', 17508, 273523615, 15622.8],
  ['Europe', 'Finland', 188000, 5540720, 29.5],
  ['Asia', 'Japan', 6853, 126476461, 18455.6],
  ['Europe', 'Sweden', 221800, 10099265, 45.5],
];

final months = [
  ['Winter', 'Spring', 'Summer', 'Autumn'],
  ['December', 'March', 'June', 'September'],
  ['January', 'April', 'July', 'October'],
  ['February', 'May', 'August', 'November']
];

final numbers = [
  ['First', 'Second', 'Third'],
  [85, 10, 27],
  [512, 2348, 12037],
  [5, 10, 3],
  [512, -1, 037],
  [1, 10, 100],
];

final numbersWithNulls = [
  ['First', 'Second', 'Third'],
  [85, 10, 27],
  [512, 2348, null],
  [null, 10, 3],
  [512, -1, null],
  [1, 10, 100],
];
