import 'package:flutter/foundation.dart';

import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products.dart';

enum ViewStatus { idle, loading, success, failure }

class ProductsController extends ChangeNotifier {
  ProductsController(this._getProducts);

  final GetProducts _getProducts;

  ViewStatus _status = ViewStatus.idle;
  List<Product> _products = const [];

  ViewStatus get status => _status;
  List<Product> get products => _products;

  Future<void> load() async {
    _status = ViewStatus.loading;
    notifyListeners();
    try {
      _products = await _getProducts();
      _status = ViewStatus.success;
    } catch (_) {
      _status = ViewStatus.failure;
    }
    notifyListeners();
  }
}
