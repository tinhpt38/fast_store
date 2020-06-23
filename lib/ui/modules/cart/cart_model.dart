

import 'package:fast_store/core/model/product.dart';
import 'package:fast_store/ui/base/page_base_model.dart';

class CartModel extends PageModel{
  List<Product> _products = List();
  List<Product> get product => _products;

  setProduct(List<Product> value){
    _products = value;
    notifyListeners();
  }
}