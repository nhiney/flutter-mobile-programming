import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tuan_7/main.dart';

void main() {
  testWidgets('Main Menu smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const VideoRecorderApp());

    // Verify that the menu title is present.
    expect(find.text('Danh sách Bài tập'), findsOneWidget);

    // Verify that Exercise 3 is listed.
    expect(find.text('Bài tập 3'), findsOneWidget);
    expect(find.text('Video Recorder & Playback'), findsOneWidget);
  });
}
