import 'package:flutter_test/flutter_test.dart';
import 'package:practice/simple_widget.dart';

void main() {
  testWidgets('MyWidget has a title and message', (tester) async {
    await tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));
    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    // Use the `findsOneWidget` matcher provided by flutter_test to verify
    // that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });

  testWidgets('Test Widget', (widgetTester) async {
    await widgetTester.pumpWidget(const MyWidget(title: 'T', message: 'M'));

    final finder = find.text('T');

    expect(finder, findsOneWidget);
  });
}
