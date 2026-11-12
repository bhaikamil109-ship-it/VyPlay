/// Persists plugin enabled/disabled state across sessions.
abstract class PluginStateStore {
  /// Returns a map of plugin id -> enabled flag.
  Future<Map<String, bool>> load();

  /// Persists the given enabled flags.
  Future<void> save(Map<String, bool> enabled);
}