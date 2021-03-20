// SPDX-FileCopyrightText: (c) 2021 Art Galkin <github.com/rtmigo>
// SPDX-License-Identifier: MIT

import 'package:tabular/src/inner.dart';
import 'package:test/test.dart';

class TestWrapper
{
  TestWrapper(this.inner);
  final dynamic inner;
  @override
  String toString() {

    return inner.toString();
  }
}

void main() {

  // test('cellToString', () {
  //   expect(Tabu().cellToString('sample text'), 'sample text');
  //   expect(Tabu().cellToString(100), '100');
  //   expect(Tabu().cellToString(null), '');
  //   expect(Tabu(nullReplacement: '~').cellToString(null), '~');
  // });
  //
  // test('isNumber', () {
  //   expect(Tabu().isNumber(5), true);
  //   expect(Tabu().isNumber(5.0), true);
  //   expect(Tabu().isNumber(null), true);
  //   expect(Tabu().isNumber(''), true);
  //   expect(Tabu().isNumber('5'), true);
  //   expect(Tabu().isNumber('5.0'), true);
  //   expect(Tabu().isNumber(TestWrapper(5.0)), true);
  //   expect(Tabu().isNumber('wow'), false);
  // });
  //
  // test('guessAlignColumn', () {
  //   expect(Tabu().guessAlignColumn(['a','b','c']), Side.left);
  //   expect(Tabu().guessAlignColumn([1853,3423,123]), Side.right);
  //   expect(Tabu().guessAlignColumn([1853,null,123]), Side.right);
  //   expect(Tabu().guessAlignColumn([1853,'',123]), Side.right);
  // });
}
