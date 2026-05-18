import '../../../../core/network/api_client.dart';
import '../models/product_model.dart';

class ProductRemoteDataSource {
  const ProductRemoteDataSource(this._api);

  final ApiClient _api;

  Future<List<ProductModel>> fetchProducts() async {
    final data = await _api.getJson('/products');
    if (data is! List) {
      throw ApiException('Unexpected response shape');
    }
    return data
        .whereType<Map<String, dynamic>>()
        .map(ProductModel.fromJson)
        .toList();
  }
}
