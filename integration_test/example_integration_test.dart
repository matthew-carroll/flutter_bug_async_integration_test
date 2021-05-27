import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_test_async_bug/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('example integration test', (tester) async {
    print('Starting integration test');
    HttpOverrides.global = null;

    await tester.pumpWidget(MyApp());

    await tester.tap(find.byKey(ValueKey('button_ping')));
    print('Done with tap');
    await tester.pumpAndSettle();

    print('Done with test');
  });
}
