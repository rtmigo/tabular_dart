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
