// SPDX-FileCopyrightText: (c) 2021 Art Galkin <github.com/rtmigo>
// SPDX-License-Identifier: MIT



import 'package:test/test.dart';

import 'common.dart';



void main() {
  test('tst', () {
    List<String> lst;

    lst = ['ABCD','DEF'];
    removeCommonBlanksAtLeft(lst);
    expect(lst, ['ABCD','DEF']);

    // two blanks each
    lst = ['  ABCD','  DEF'];
    removeCommonBlanksAtLeft(lst);
    expect(lst, ['ABCD','DEF']);

  });

}
