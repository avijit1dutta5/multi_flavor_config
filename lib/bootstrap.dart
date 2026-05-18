import 'package:flutter/widgets.dart';

import 'app.dart';
import 'core/di/injector.dart';
import 'core/flavor/flavors.dart';

/// Shared startup path for every flavor entrypoint.
void bootstrap(AppFlavor flavor) {
  WidgetsFlutterBinding.ensureInitialized();
  configureFlavor(flavor);
  configureDependencies();
  runApp(const MultiFlavorApp());
}
