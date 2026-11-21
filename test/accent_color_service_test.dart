import 'package:flutter_test/flutter_test.dart';
import 'package:vyplay/core/services/accent_color_service.dart';

void main() {
  group('AccentColorService', () {
    test('provides a compact non-empty accessible preset palette', () {
      expect(AccentColorService.presets.length, greaterThanOrEqualTo(5));
      expect(AccentColorService.presets.values.toSet().length,
          AccentColorService.presets.length);
    });

    test('parses saved hexadecimal values with or without 0x prefix', () {
      expect(AccentColorService.parseStoredValue('ffe53945'), 0xFFE53945);
      expect(AccentColorService.parseStoredValue('0xffe53945'), 0xFFE53945);
      expect(AccentColorService.parseStoredValue('invalid'), isNull);
      expect(AccentColorService.parseStoredValue(null), isNull);
    });
  });
}
