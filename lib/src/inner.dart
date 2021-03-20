// SPDX-FileCopyrightText: (c) 2021 Art Galkin <github.com/rtmigo>
// SPDX-License-Identifier: MIT

import 'dart:math';

import 'package:quiver/iterables.dart' show enumerate;

enum Side { left, right, center }

class Align {
  Align(this.column, this.side);

  final dynamic column;
  final Side side;
}

class Sort {
  Sort(this.column, [this.ascending = true]);

  dynamic column;
  bool ascending;
}

String alignText(String text, int targetWidth, Side align) {
  switch (align) {
    case Side.left:
      return text.padRight(targetWidth);
    case Side.right:
      return text.padLeft(targetWidth);
    case Side.center:
      return alignTextCenter(text, targetWidth);
  }
}

String alignTextCenter(String text, int targetWidth) {
  final half = (targetWidth - text.length) >> 1;
  text = text.padLeft(text.length + half);
  text = text.padRight(targetWidth);
  return text;
}

class Cell implements Comparable<Cell> {
  Cell(this.rawCell, {this.nullReplacement = ''});

  final dynamic rawCell;
  final String nullReplacement;

  @override
  String toString() {
    if (rawCell == null) {
      return nullReplacement;
    } else {
      return rawCell.toString();
    }
  }

  bool isNumber() {
    if (rawCell == null || rawCell == '' || rawCell is num) {
      return true;
    }

    final s = rawCell.toString();

    return int.tryParse(s) != null || double.tryParse(s) != null;
  }

  Side guessAlign() {
    return isNumber() ? Side.right : Side.left;
  }

  num? tryGetNum() {
    // todo cache
    if (this.rawCell is num) {
      return this.rawCell;
    }
    return int.tryParse(this.rawCell.toString()) ?? double.tryParse(this.rawCell.toString());
  }

  @override
  int compareTo(Cell other) {
    num? thisNum = this.tryGetNum();
    if (thisNum != null) {
      num? otherNum = other.tryGetNum();
      if (otherNum != null) {
        return thisNum.compareTo(otherNum);
      }
    }
    // todo null
    return this.toString().compareTo(other.toString());
  }
}

class CellsColumn {
  CellsColumn(this.matrix, this.index) {
    if (cells.length <= 1) {
      throw ArgumentError.value(cells.length, 'cells.length');
    }
  }

  final int index;
  final CellsMatrix matrix;

  Iterable<Cell> get cells sync* {
    for (var i = 0; i < matrix.rows.length; ++i) {
      yield this.matrix.rows[i][this.index];
    }
  }

  int get textWidth {
    // todo cache
    return this.cells.map<int>((cell) => cell.toString().length).reduce(max);
  }

  Side guessAlign() {
    Side? result;

    for (final cell in this.cells.skip(1)) {
      if (result == null) {
        result = cell.guessAlign();
      } else if (cell.guessAlign() != result) {
        return Side.left; // default
      }
    }

    result ??= Side.left;
    return result;
  }
}

class CellsMatrix {
  CellsMatrix(List<List<dynamic>> rawRows) {
    if (rawRows.length <= 1) {
      throw ArgumentError.value(rawRows.length, 'rawRows.length',
          'Must contain at least two items: the header and the first row.');
    }

    // determining the maximum count of cells in each row
    final columnsCount = rawRows.map<int>((r) => r.length).reduce(max);

    if (columnsCount <= 0) {
      throw ArgumentError('rawRows contains zero columns.');
    }

    // creating [rows] field
    for (final srcRow in rawRows) {
      // copying raw cell data into list on Cells
      final newRow = srcRow.map((raw) => Cell(raw)).toList();
      // adding empty cells to the end of the row, if needed
      while (newRow.length < columnsCount) {
        newRow.add(Cell(null));
      }
      this.rows.add(newRow);
    }
    // creating the columns list
    for (var i = 0; i < columnsCount; ++i) {
      this.columns.add(CellsColumn(this, i));
    }

    assert(this.rows.isNotEmpty);
  }

  List<Cell> get header => rows[0];

  List<List<Cell>> rows = <List<Cell>>[];

  Iterable<Cell> iterCellsByColumn(int columnIdx) sync* {
    for (var i = 0; i < rows.length; ++i) {
      yield rows[i][columnIdx];
    }
  }

  List<CellsColumn> columns = <CellsColumn>[];

  int columnIndex(dynamic col) {
    if (col is int) {
      return col;
    }
    String colStr = col.toString();
    for (var me in enumerate(header)) {
      if (me.value.toString() == colStr) {
        return me.index;
      }
    }
    throw ArgumentError.value(col, 'col', 'Column not found.');
  }

  void sortBy(List<int> columnIndexes1based) {
    if (this.columns.isEmpty) {
      return;
    }

    // replacing header with empty placeholder
    final temporaryRemovedHeader = this.rows[0];
    this.rows[0] = [];
    // since this.columnsCount>0, only a placeholder can be an empty row

    try {
      this.rows.sort((row1, row2) {
        if (row1.isEmpty) {
          // header placeholder
          return -1;
        }

        if (row2.isEmpty) {
          // header placeholder
          return 1;
        }

        for (final colIndex1based in columnIndexes1based) {
          if (colIndex1based == 0) {
            throw ArgumentError.value(colIndex1based, 'colIndex');
          }

          var idx = colIndex1based.abs() - 1;
          var cell1 = row1[idx];
          var cell2 = row2[idx];

          //print('Comparing $cell1 $cell2');

          int cmp = cell1.compareTo(cell2);
          if (cmp == 0) {
            continue;
          }
          if (cmp > 0) {
            //print('Ret ${colIndex1based.sign}');
            return colIndex1based.sign;
          }
          return -colIndex1based.sign;
        }
        ;
        return 0;
      });
    } finally {
      this.rows[0] = temporaryRemovedHeader;
    }
  }
}

/// @param rowsOnly Rows to be sorted (without the header).
/// @param columnIndexes Determines the sorting order. `[2,-3,1]` means, that rows must
/// be sorted by column 2 ascending, or -3 descending, or 1 ascending.
void sortRo(List<List<dynamic>> rowsOnly, List<int> columnIndexes1based) {
  rowsOnly.sort((row1, row2) {
    for (final colIndex1based in columnIndexes1based) {
      if (colIndex1based == 0) {
        throw ArgumentError.value(colIndex1based, 'colIndex');
      }
      var idx = colIndex1based.abs() - 1;
      var cell1 = row1[idx];
      var cell2 = row2[idx];

      if (cell1 == cell2) {
        continue;
      }
      if (cell1 > cell2) {
        return colIndex1based.sign;
      }
      return -colIndex1based.sign;
    }
    ;
    return 0;
  });
}

void sortFull(List<List<dynamic>> rows, List<int> columnIndexes) {
  final allExceptHeader = rows.skip(1).toList();
  sortRo(allExceptHeader, columnIndexes);
  rows.length = 1;
  rows.addAll(allExceptHeader);
}

Iterable<dynamic> enumerateColumn(List<List<dynamic>> rows, int colIndex) sync* {
  for (final row in rows) {
    yield row[colIndex];
  }
}

/// @param sorting Determines the sorting order.
String tabular(List<List<dynamic>> rows,
    {List<Side>? headerAlign,
    List<Side>? rowAlign,
    List<Sort>? sort,
    markdownAlign = false,
    outerBorder = false}) {
  final matrix = CellsMatrix(rows);

  if (sort != null) {
    final sortingIndexes = <int>[]; // 1-based
    for (var item in sort) {
      var idx = matrix.columnIndex(item.column) + 1;
      if (!item.ascending) {
        idx = -idx;
      }
      sortingIndexes.add(idx);
    }

    matrix.sortBy(sortingIndexes);
  }

  String bar = '';
  if (outerBorder) {
    bar += '|';
  }
  for (int i = 0; i < matrix.columns.length; ++i) {
    final align = markdownAlign ? matrix.columns[i].guessAlign() : null;
    final width = matrix.columns[i].textWidth;

    final bool isFirstColumn = i == 0;
    final bool isLastColumn = i == matrix.columns.length - 1;

    int extra = ((isFirstColumn || isLastColumn) && !outerBorder) ? -1 : 0;

    switch (align) {
      case null:
      case Side.left:
        bar += ('-' * (width + 2 + extra));
        break;
      case Side.right:
        bar += ('-' * (width + 1 + extra) + ':');
        break;
      case Side.center:
        bar += (':' + '-' * width + ':');
    }

    if (outerBorder || !isLastColumn) {
      bar += '|';
    }
  }

  final formattedRows = <String>[];

  var iRow = -1;
  for (var row in matrix.rows) {
    iRow++;

    if (iRow == 1) {
      formattedRows.add(bar);
    }

    var formatted = '';

    var iCol = -1;

    for (final me in enumerate(row)) {
      final cell = me.value;
      if (me.index == 0) {
        if (outerBorder) {
          formatted += '| ';
        }
      } else {
        formatted += ' | ';
      }

      iCol++;

      formatted += alignText(
          cell.toString(), matrix.columns[iCol].textWidth, matrix.columns[iCol].guessAlign());
    }

    if (outerBorder) {
      formatted += ' |';
    }

    formattedRows.add(formatted);
  }

  return formattedRows.join('\n');
}
