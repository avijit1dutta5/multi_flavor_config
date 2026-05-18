import 'package:flavor_config/flavor_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:multi_flavor_config/core/flavor/flavors.dart';

void main() {
  setUp(FlavorConfig.reset);

  test('configureFlavor wires per-flavor values', () {
    configureFlavor(AppFlavor.gujarat);
    final c = FlavorConfig.instance;

    expect(c.name, 'gujarat');
    expect(c.displayName, 'Gujarat Power');
    expect(c.baseUrl, 'https://fakestoreapi.com');
    expect(c.enableBetaTab, isFalse);
  });

  test('each flavor has a distinct seed color', () {
    configureFlavor(AppFlavor.karnataka);
    final karnataka = FlavorConfig.instance.seedColor;
    configureFlavor(AppFlavor.kerala);
    final kerala = FlavorConfig.instance.seedColor;

    expect(karnataka, isNot(kerala));
  });
}
