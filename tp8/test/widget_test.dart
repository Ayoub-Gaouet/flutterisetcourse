import 'package:flutter_test/flutter_test.dart';
import 'package:tp8/Counter.dart';

void main() {
  test('Counter value should be incremented', () {
    final counter = Counter();
    counter.increment();
    expect(counter.value, 1);
  });
}
