import '../entities/product.dart';
import '../repositories/product_repository.dart';

/// Single-responsibility use case: fetch the product catalogue.
class GetProducts {
  const GetProducts(this._repository);

  final ProductRepository _repository;

  Future<List<Product>> call() => _repository.getProducts();
}
