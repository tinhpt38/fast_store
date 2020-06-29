import 'package:fast_store/core/model/product.dart';

class CartStore {
  static CartStore instance = CartStore._internal();

  CartStore._internal();

  factory CartStore() => instance;

  static List<Product> _products = List();
  static List<Product> get products => _products;
  static Map<String, int> _quantityOfProduct = Map();
  static Map<String, int> get quantityOfProduct => _quantityOfProduct;

  static addProduct(Product value) {
    if (productIsExit(value)) {
      int quantity = _quantityOfProduct[value.id.toString()] + 1;
      changeQuantity(value.id.toString(), quantity);
    } else {
      _products.add(value);
      changeQuantity(value.id.toString(), 1);
    }
  }

  static changeQuantity(String productID, int quantity) {
    _quantityOfProduct[productID] = quantity;
  }

  static bool productIsExit(Product product) {
    products.forEach((element) {
      if (element.id == product.id) {
        return true;
      }
    });
    return false;
  }
}
