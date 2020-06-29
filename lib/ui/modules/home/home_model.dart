import 'package:fast_store/core/model/category.dart';
import 'package:fast_store/core/model/product.dart';
import 'package:fast_store/core/services/api.dart';
import 'package:fast_store/core/singletone/cart_store.dart';
import 'package:fast_store/ui/base/page_base_model.dart';

class HomeModel extends PageModel {
  List<Product> _products = List();
  List<Product> get product => _products;
  // List<Category> _categories = [
  //   Category(1, "Điện thoại"),
  //   Category(2, "Phụ kiện máy tính"),
  //   Category(3, "Phụ kiện điện thoại"),
  // ];
  List<Category> _categories = List();
  List<Category> get categories => _categories;

  setProduct(List<Product> value) {
    _products = value;
    notifyListeners();
  }

  setCategory(List<Category> value) {
    _categories = value;
    notifyListeners();
  }

  productFormCategory(int id) {
    List<Product> prs = List();
    _products.forEach((element) {
      if (element.categoryId == id) {
        prs.add(element);
      }
    });
    return prs;
  }

  getDataFromApi() async {
    setBusy(true);
    await Api().getCategory(
        onError: (_) {},
        onSuccess: (values) {
          setCategory(values);
        });
    await Api().getAllProducts(
        onError: (_) {},
        onsuccess: (value) {
          setProduct(value);
          setBusy(false);
        });
  }

  search(String query) async {
    setBusy(true);
    await Api().search(query, onsuccess: (value) {
      setProduct(value);
      setBusy(false);
    }, onError: (msg) {});
  }

  onBuyClick(Product value) {
    CartStore.addProduct(value);
  }
}
