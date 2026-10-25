import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';

void main() {
  testWidgets('home page shows its title, movie cards, and booking buttons',
      (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('Southsea Cinema - Movies'), findsOneWidget);

    expect(find.byType(Card), findsNWidgets(2));
    expect(find.text('Inglorious Bastards'), findsOneWidget);
    expect(find.text("Cheech and Chong- Still smokin'"), findsOneWidget);

    expect(find.widgetWithText(ElevatedButton, 'Order'), findsNWidgets(2));
  });
}