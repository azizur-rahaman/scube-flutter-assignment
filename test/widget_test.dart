// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:scube_flutter_assignment/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ScubeApp());

    // Verify that Splash Page is shown
    expect(find.text('SCUBE'), findsOneWidget);
    expect(find.text('Control & Monitoring System'), findsOneWidget);

    // Pump frames to allow timer to complete (though we won't test full navigation here without more setup)
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
  });
}
