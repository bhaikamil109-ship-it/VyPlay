import 'package:flutter/material.dart';
import 'package:vyplay/infrastructure/database/database.dart';

/// Persisted accent palette. Keeping this outside SettingsState avoids changing
/// the generated BLoC contracts just to repaint the Material theme.
class AccentColorService extends ChangeNotifier {
  AccentColorService._();
  static final AccentColorService instance = AccentColorService._();

  static const String settingKey = 'accent-color';
  static const Map<String, int> presets = <String, int>{
    'Crimson': 0xFFE53945,
    'Violet': 0xFF8B5CF6,
    'Ocean': 0xFF0D84C6,
    'Teal': 0xFF009688,
    'Amber': 0xFFFFA000,
    'Rose': 0xFFD94F91,
  };

  int _value = presets['Crimson']!;
  bool _loaded = false;

  Color get color => Color(_value);
  int get value => _value;
  bool get isLoaded => _loaded;

  Future<void> load() async {
    final stored = await AppDatabase.instance.getSetting(settingKey);
    final parsed = parseStoredValue(stored);
    if (parsed != null && presets.values.contains(parsed)) {
      _value = parsed;
    }
    _loaded = true;
    notifyListeners();
  }

  Future<void> select(int value) async {
    if (!presets.values.contains(value) || value == _value) return;
    await AppDatabase.instance.setSetting(
      settingKey,
      value.toRadixString(16),
    );
    _value = value;
    _loaded = true;
    notifyListeners();
  }

  static int? parseStoredValue(String? stored) {
    if (stored == null || stored.isEmpty) return null;
    final normalized = stored.toLowerCase().replaceFirst('0x', '');
    return int.tryParse(normalized, radix: 16);
  }
}
