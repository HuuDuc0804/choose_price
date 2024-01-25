import 'package:choose_price/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Home page test', () {
    testWidgets('Change product name after each click',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      expect(find.text(products[0].name), findsOneWidget);

      for (var i = 1; i < products.length; i++) {
        await tester.tap(find.text('Check'));
        await tester.pump();
        expect(find.text(products[i].name), findsOneWidget);
      }

      expect(find.text(products[5].name), findsOneWidget);
    });

    testWidgets('Show result after each click', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      await tester.enterText(
        find.byKey(const Key('priceInput')),
        products[0].price.toString(),
      );
      await tester.tap(find.text('Check'));
      await tester.pump();
      expect(find.text('pass'), findsOneWidget);
    });
  });
}
