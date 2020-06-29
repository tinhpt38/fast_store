import 'package:fast_store/core/model/product.dart';
import 'package:fast_store/core/singletone/cart_store.dart';
import 'package:fast_store/ui/base/page_base_model.dart';

class CartModel extends PageModel {
  List<Product> get products => CartStore.products;
  Map<String, int> get quantityOfProduct => CartStore.quantityOfProduct;

  CartModel();

  Product getProductOfID(String id) {
    Product pr;
    products.forEach((e) {
      if (e.id.toString() == id) {
        pr = e;
      }
    });
    return pr;
  }
}
