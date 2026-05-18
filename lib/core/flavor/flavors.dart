import 'dart:ui';

import 'package:flavor_config/flavor_config.dart';

/// The three demo flavors — one codebase, three branded state builds.
enum AppFlavor { karnataka, gujarat, kerala }

/// Initializes [FlavorConfig] for the given [flavor]. Each flavor-specific
/// entrypoint (`main_<flavor>.dart`) calls this before `runApp`.
void configureFlavor(AppFlavor flavor) {
  switch (flavor) {
    case AppFlavor.karnataka:
      FlavorConfig.initialize(
        name: 'karnataka',
        values: {
          'displayName': 'Karnataka Power',
          'baseUrl': 'https://fakestoreapi.com',
          'seedColor': 0xFF0066FF,
          'enableBetaTab': true,
        },
      );
    case AppFlavor.gujarat:
      FlavorConfig.initialize(
        name: 'gujarat',
        values: {
          'displayName': 'Gujarat Power',
          'baseUrl': 'https://fakestoreapi.com',
          'seedColor': 0xFFEA580C,
          'enableBetaTab': false,
        },
      );
    case AppFlavor.kerala:
      FlavorConfig.initialize(
        name: 'kerala',
        values: {
          'displayName': 'Kerala Power',
          'baseUrl': 'https://fakestoreapi.com',
          'seedColor': 0xFF10B981,
          'enableBetaTab': true,
        },
      );
  }
}

/// Convenience typed accessors over [FlavorConfig].
extension FlavorX on FlavorConfig {
  String get displayName => get<String>('displayName');
  String get baseUrl => get<String>('baseUrl');
  Color get seedColor => Color(get<int>('seedColor'));
  bool get enableBetaTab => getOr<bool>('enableBetaTab', false);
}
