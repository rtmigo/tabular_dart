// SPDX-FileCopyrightText: (c) 2021 Art Galkin <github.com/rtmigo>
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

void removeCommonBlanksAtLeft(List<String> lines) {
  while (!lines.any((element) => element.isEmpty)) {
    // while there are no empty lines (so they all have a first char)
    final firstCharSet = lines.map((str) => str[0]).toSet();
    //print(firstCharSet);
    if (firstCharSet.length==1 && ['\t', ' '].contains(firstCharSet.first)) {
      // all the lines have exactly the same first char, and it's a blank.
      // Recreating the lines list with first char removed

      final newLines = lines.map((str) => str.substring(1)).toList();
      lines.clear();
      lines.addAll(newLines);

      continue; // try again, maybe there are more blanks to remove
    }
    break; // no, there are not common blanks
  }
}

String testTrim(String s) {

  final lines = s.split('\n');

  // removing empty lines at the beginning of the list
  while (lines.isNotEmpty && lines.first.isEmpty) {
    lines.removeAt(0);
  }

  // removing empty lines at the end of the list
  while (lines.isNotEmpty && lines.last.isEmpty) {
    lines.removeLast();
  }

  removeCommonBlanksAtLeft(lines);

  return lines.join('\n');
}


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
