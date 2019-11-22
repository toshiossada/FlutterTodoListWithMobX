import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobx_example/app/modules/home/components/item/item_widget.dart';

main() {
  testWidgets('ItemWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(ItemWidget()));
    final textFinder = find.text('Item');
    expect(textFinder, findsOneWidget);
  });
}
