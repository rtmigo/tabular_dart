// SPDX-FileCopyrightText: (c) 2021 Artёm IG <github.com/rtmigo>
// SPDX-License-Identifier: MIT

import 'package:tabular/src/inner.dart';
import 'package:test/test.dart';

void main() {
  test('split line', () {
    expect(isSplitLine(split_line), true);
    expect(isSplitLine(['anything']), false);
  });
}
