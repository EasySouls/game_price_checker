import 'package:flutter_test/flutter_test.dart';
import 'package:game_price_checker/app/app.dart';
import 'package:game_price_checker/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
