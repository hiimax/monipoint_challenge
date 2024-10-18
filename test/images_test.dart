import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:monipoint_challenge/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.imageBg).existsSync(), isTrue);
    expect(File(Images.profile).existsSync(), isTrue);
  });
}
