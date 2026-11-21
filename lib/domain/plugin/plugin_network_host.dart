/// Normalizes a plugin-declared DNS host for exact allowlist matching.
///
/// Plugin network permissions intentionally accept DNS names only. IP literals,
/// single-label hosts and local/reserved suffixes are rejected to reduce SSRF
/// and local-network exposure. IDNs should be supplied as ASCII punycode.
String normalizePluginNetworkHost(String host) {
  return host.trim().toLowerCase().replaceFirst(RegExp(r'\.$'), '');
}

/// Returns whether [host] is a public-looking, fully-qualified DNS hostname.
///
/// This is syntax/policy validation, not DNS resolution. A future real network
/// transport must also defend against DNS rebinding and private-address answers.
bool isValidPluginNetworkHost(String host) {
  final normalized = normalizePluginNetworkHost(host);
  if (normalized.isEmpty || normalized.length > 253) return false;

  // DNS names only: no URL, port, wildcard, path, whitespace or IP literal.
  if (!RegExp(r'^[a-z0-9.-]+$').hasMatch(normalized)) return false;
  if (normalized.contains('..') || normalized.startsWith('.') ||
      normalized.endsWith('.')) {
    return false;
  }

  final labels = normalized.split('.');
  if (labels.length < 2) return false;

  final labelPattern = RegExp(r'^[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?$');
  if (labels.any((label) => label.length > 63 ||
      !labelPattern.hasMatch(label))) {
    return false;
  }

  // Numeric-only dotted names are IP literals (or ambiguous legacy IP forms).
  if (labels.every((label) => int.tryParse(label) != null)) return false;
  if (int.tryParse(labels.last) != null) return false;

  const blockedSuffixes = {
    'localhost',
    'local',
    'internal',
    'lan',
    'home',
    'test',
    'invalid',
  };
  if (blockedSuffixes.contains(labels.last)) return false;

  return true;
}
