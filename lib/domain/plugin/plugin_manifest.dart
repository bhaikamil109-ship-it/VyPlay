import 'package:vyplay/domain/plugin/plugin_capability.dart';
import 'package:vyplay/domain/plugin/plugin_contribution.dart';
import 'package:vyplay/domain/plugin/plugin_network_host.dart';

/// Declarative metadata for a plugin.
///
/// Plugins are compile-time-registered declarative modules. A manifest must be
/// validated before registration. No executable code is carried by a manifest.
class PluginManifest {
  const PluginManifest({
    required this.id,
    required this.name,
    required this.version,
    required this.description,
    required this.provider,
    required this.platforms,
    required this.capabilities,
    required this.minAppVersion,
    this.configSchema = const <String, PluginConfigField>{},
    this.homepage,
    this.contributions = const <PluginContributionSpec>[],
    this.allowedNetworkHosts = const <String>[],
    this.networkHosts = const <String>{},
  });

  final String id;
  final String name;
  final String version;
  final String description;
  final String provider;
  final List<String> platforms;
  final List<PluginCapability> capabilities;
  final String minAppVersion;
  final Map<String, PluginConfigField> configSchema;
  final String? homepage;

  /// Exact DNS hostnames this plugin may contact when network capability is
  /// granted. Wildcards, IP literals and local-only names are not allowed.
  final Set<String> networkHosts;

  /// Declarative extension contributions. Registered by the host when the
  /// plugin is enabled, removed when it is disabled, and gated on the
  /// capabilities actually granted to the plugin.
  final List<PluginContributionSpec> contributions;

  /// Exact DNS hosts the plugin may contact when the network capability is
  /// granted. Empty means the plugin has no network destinations approved.
  final List<String> allowedNetworkHosts;

  /// Returns a list of validation errors. Empty means valid.
  List<String> validate() {
    final errors = <String>[];
    if (id.trim().isEmpty) errors.add('Plugin id must not be empty');
    if (!RegExp(r'^[a-z0-9][a-z0-9._-]*$').hasMatch(id)) {
      errors.add('Plugin id must be lowercase alphanumeric with . _ -');
    }
    if (name.trim().isEmpty) errors.add('Plugin name must not be empty');
    if (version.trim().isEmpty) errors.add('Plugin version must not be empty');
    if (!_isValidVersion(version)) {
      errors.add('Plugin version must follow semantic versioning (x.y.z)');
    }
    if (provider.trim().isEmpty) {
      errors.add('Plugin provider must not be empty');
    }
    if (platforms.isEmpty) {
      errors.add('Plugin must declare at least one platform');
    }
    if (minAppVersion.trim().isEmpty) {
      errors.add('Plugin must declare a minimum app version');
    }
    if (!_isValidVersion(minAppVersion)) {
      errors.add('Minimum app version must follow semantic versioning (x.y.z)');
    }
    // Duplicate capabilities are not allowed.
    if (capabilities.toSet().length != capabilities.length) {
      errors.add('Plugin capabilities must not contain duplicates');
    }
    if (allowedNetworkHosts.isNotEmpty &&
        !capabilities.contains(PluginCapability.network)) {
      errors.add(
        'Allowed network hosts require the network capability to be declared',
      );
    }
    final normalizedHosts = <String>{};
    for (final host in allowedNetworkHosts) {
      if (!isValidPluginNetworkHost(host)) {
        errors.add('Invalid plugin network host "$host"');
        continue;
      }
      final normalized = normalizePluginNetworkHost(host);
      if (!normalizedHosts.add(normalized)) {
        errors.add('Duplicate plugin network host "$host"');
      }
    }
    if (capabilities.contains(PluginCapability.network) &&
        networkHosts.isEmpty) {
      errors.add(
          'Network capability requires at least one declared network host');
    }
    if (!capabilities.contains(PluginCapability.network) &&
        networkHosts.isNotEmpty) {
      errors.add('Network hosts require the network capability');
    }
    for (final host in networkHosts) {
      if (!_isValidNetworkHost(host)) {
        errors.add('Invalid network host "$host"');
      }
    }

    // Contribution declarations must be unique and must only target points
    // whose required capability the plugin actually declares.
    final contributionKeys = <String>{};
    for (final contribution in contributions) {
      if (contribution.id.trim().isEmpty) {
        errors.add('Contribution id must not be empty');
      }
      final required = contribution.point.requiredCapability;
      if (required != null && !capabilities.contains(required)) {
        errors.add(
          'Contribution "${contribution.id}" targets '
          '${contribution.point.id} but the plugin does not declare the '
          '${required.id} capability',
        );
      }
      if (!contributionKeys.add(contribution.key)) {
        errors.add('Duplicate contribution "${contribution.key}"');
      }
    }
    for (final field in configSchema.values) {
      final fieldErrors = field.validate();
      for (final error in fieldErrors) {
        errors.add('Config field "${field.key}": $error');
      }
    }
    return errors;
  }

  bool get isValid => validate().isEmpty;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'version': version,
        'description': description,
        'provider': provider,
        'platforms': platforms,
        'capabilities': capabilities.map((c) => c.id).toList(growable: false),
        'minAppVersion': minAppVersion,
        'configSchema': configSchema.map(
          (key, value) => MapEntry(key, value.toJson()),
        ),
        if (homepage != null) 'homepage': homepage,
        'networkHosts': (networkHosts.toList()..sort()),
        'contributions': contributions
            .map((contribution) => contribution.toJson())
            .toList(growable: false),
        'allowedNetworkHosts': allowedNetworkHosts,
      };

  factory PluginManifest.fromJson(Map<String, dynamic> json) {
    final rawCapabilities = json['capabilities'];
    final capabilities = <PluginCapability>[];
    if (rawCapabilities is List) {
      for (final entry in rawCapabilities) {
        final parsed = PluginCapabilityX.tryParse(entry?.toString() ?? '');
        if (parsed != null) capabilities.add(parsed);
      }
    }
    final rawSchema = json['configSchema'];
    final schema = <String, PluginConfigField>{};
    if (rawSchema is Map) {
      for (final entry in rawSchema.entries) {
        if (entry.value is Map) {
          final field = PluginConfigField.fromJson(
            Map<String, dynamic>.from(entry.value as Map),
          );
          schema[field.key] = field;
        }
      }
    }
    final rawContributions = json['contributions'];
    final contributions = <PluginContributionSpec>[];
    if (rawContributions is List) {
      for (final entry in rawContributions) {
        if (entry is Map) {
          final spec = PluginContributionSpec.tryFromJson(
            Map<String, dynamic>.from(entry),
          );
          if (spec != null) contributions.add(spec);
        }
      }
    }
    final rawNetworkHosts = json['networkHosts'];
    final networkHosts = rawNetworkHosts is List
        ? rawNetworkHosts.map((entry) => entry.toString()).toSet()
        : <String>{};
    final rawPlatforms = json['platforms'];
    final rawNetworkHosts = json['allowedNetworkHosts'];
    return PluginManifest(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      version: json['version']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      provider: json['provider']?.toString() ?? '',
      platforms: rawPlatforms is List
          ? rawPlatforms.map((e) => e.toString()).toList(growable: false)
          : const <String>[],
      capabilities: capabilities,
      minAppVersion: json['minAppVersion']?.toString() ?? '',
      configSchema: schema,
      homepage: json['homepage']?.toString(),
      contributions: contributions,
      networkHosts: networkHosts,
    );
  }

  static bool _isValidNetworkHost(String value) {
    if (value.isEmpty || value != value.toLowerCase() || value.length > 253) {
      return false;
    }
    if (value.contains('*') || value.contains(':') || value.endsWith('.')) {
      return false;
    }
    if (value == 'localhost' ||
        value.endsWith('.localhost') ||
        value.endsWith('.local') ||
        value.endsWith('.internal') ||
        value.endsWith('.test') ||
        value.endsWith('.invalid')) {
      return false;
    }
    final labels = value.split('.');
    if (labels.length < 2) return false;
    for (final label in labels) {
      if (label.isEmpty ||
          label.length > 63 ||
          label.startsWith('-') ||
          label.endsWith('-')) {
        return false;
      }
      for (final unit in label.codeUnits) {
        final isLetter = unit >= 97 && unit <= 122;
        final isDigit = unit >= 48 && unit <= 57;
        if (!isLetter && !isDigit && unit != 45) return false;
      }
    }
    // A public DNS suffix must contain a letter; this rejects numeric IP
    // forms, including shortened and all-numeric dotted addresses.
    if (!labels.last.codeUnits.any((unit) => unit >= 97 && unit <= 122)) {
      return false;
    }
    return true;
  }

  static bool _isValidVersion(String value) {
    return RegExp(r'^\d+\.\d+\.\d+$').hasMatch(value.trim());
  }
}

/// Describes one configuration field required by a plugin.
class PluginConfigField {
  const PluginConfigField({
    required this.key,
    required this.label,
    required this.type,
    this.required = false,
    this.defaultValue,
    this.description,
  });

  final String key;
  final String label;
  final PluginConfigFieldType type;
  final bool required;
  final dynamic defaultValue;
  final String? description;

  List<String> validate() {
    final errors = <String>[];
    if (key.trim().isEmpty) errors.add('key must not be empty');
    if (label.trim().isEmpty) errors.add('label must not be empty');
    return errors;
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'key': key,
        'label': label,
        'type': type.id,
        'required': required,
        if (defaultValue != null) 'defaultValue': defaultValue,
        if (description != null) 'description': description,
      };

  factory PluginConfigField.fromJson(Map<String, dynamic> json) {
    return PluginConfigField(
      key: json['key']?.toString() ?? '',
      label: json['label']?.toString() ?? '',
      type: PluginConfigFieldTypeX.tryParse(json['type']?.toString() ?? '') ??
          PluginConfigFieldType.string,
      required: json['required'] == true,
      defaultValue: json['defaultValue'],
      description: json['description']?.toString(),
    );
  }
}

enum PluginConfigFieldType {
  string,
  boolean,
  integer,
  secret,
}

extension PluginConfigFieldTypeX on PluginConfigFieldType {
  String get id {
    switch (this) {
      case PluginConfigFieldType.string:
        return 'string';
      case PluginConfigFieldType.boolean:
        return 'boolean';
      case PluginConfigFieldType.integer:
        return 'integer';
      case PluginConfigFieldType.secret:
        return 'secret';
    }
  }

  static PluginConfigFieldType? tryParse(String value) {
    for (final type in PluginConfigFieldType.values) {
      if (type.id == value) return type;
    }
    return null;
  }
}
