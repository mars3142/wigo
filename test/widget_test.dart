import 'package:flutter_test/flutter_test.dart';
import 'package:wigo/wigo_app.dart';

void main() {
  testWidgets('Testing tests', (tester) async {
    await tester.pumpWidget(WigoApp());

    expect(1, 1);
  });
}
