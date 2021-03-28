// SPDX-FileCopyrightText: (c) 2021 Artsiom Galkin <github.com/rtmigo>
// SPDX-License-Identifier: MIT

import 'package:test/test.dart';

import 'common.dart';

void main() {
  test('tst', () {
    List<String> lst;

    expect(removeCommonBlanksAtLeft(['ABCD', 'DEF']), ['ABCD', 'DEF']);

    // two blanks each
    expect(removeCommonBlanksAtLeft(['  ABCD', '  DEF']), ['ABCD', 'DEF']);
  });
}
