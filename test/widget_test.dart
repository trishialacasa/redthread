import 'package:material_ui/material_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:redthread/main.dart';

void main() {
  testWidgets('RedThread home screen test', (WidgetTester tester) async {
    await tester.pumpWidget(const RedThreadApp());

    expect(find.text('RedThread'), findsOneWidget);
    expect(find.text('Hello, Trishia! 👋'), findsOneWidget);
    expect(find.text('Blood Availability'), findsOneWidget);
    expect(find.byIcon(Icons.home_outlined), findsOneWidget);
  });
}
