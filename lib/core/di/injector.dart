import 'package:flavor_config/flavor_config.dart';
import 'package:get_it/get_it.dart';

import '../../features/products/data/datasources/product_remote_data_source.dart';
import '../../features/products/data/repositories/product_repository_impl.dart';
import '../../features/products/domain/repositories/product_repository.dart';
import '../../features/products/domain/usecases/get_products.dart';
import '../../features/products/presentation/controllers/products_controller.dart';
import '../flavor/flavors.dart';
import '../localization/locale_controller.dart';
import '../network/api_client.dart';
import '../theme/theme_controller.dart';

final sl = GetIt.instance;

/// Wires the dependency graph. Call once after [configureFlavor].
void configureDependencies() {
  // Core / cross-cutting (singletons).
  sl.registerLazySingleton(() {
    final c = ThemeController()..seed(FlavorConfig.instance.seedColor);
    return c;
  });
  sl.registerLazySingleton(LocaleController.new);
  sl.registerLazySingleton(
    () => ApiClient(baseUrl: FlavorConfig.instance.baseUrl),
  );

  // Products feature.
  sl.registerLazySingleton(() => ProductRemoteDataSource(sl()));
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(sl()),
  );
  sl.registerLazySingleton(() => GetProducts(sl()));
  sl.registerFactory(() => ProductsController(sl()));
}
