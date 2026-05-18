import 'bootstrap.dart';
import 'core/flavor/flavors.dart';

/// Default entrypoint (Karnataka flavor) so `flutter run` works out of the box.
/// Use `flutter run -t lib/main_<flavor>.dart` for a specific flavor.
void main() => bootstrap(AppFlavor.karnataka);
