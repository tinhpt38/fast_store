import 'dart:convert';

import 'package:fast_store/core/model/category.dart';
import 'package:fast_store/core/model/product.dart';
import 'package:fast_store/core/model/user.dart';
import 'package:http/http.dart' as http;

const String host = "https://faststore20200628091030.azurewebsites.net";

class Api {
  static final Api _instance = Api._internal();
  factory Api() => _instance;
  Api._internal();

  Map<String, String> header = {"Content-Type": "application/json"};

  Future<void> getAllProducts(
      {Function(List<Product>) onsuccess, Function(String) onError}) async {
    String url = "$host/api/products";
    http.Response response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      List<Product> products = List();
      jsonData.forEach((element) {
        products.add(Product.fromJson(element));
      });

      onsuccess(products);
    } else {
      onError('Đôi khi gặp một số sự cố! Vui lòng thử lại');
    }
  }

  Future<void> getCategory(
      {Function(List<Category>) onSuccess, Function(String) onError}) async {
    const String url = "$host/api/categories";
    http.Response response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      List<Category> categories = List();
      jsonData.forEach((element) {
        categories.add(Category.fromJson(element));
      });
      onSuccess(categories);
    } else {
      onError('Đôi khi gặp một số sự cố! Vui lòng thử lại');
    }
  }

  Future<void> search(String query,
      {Function(List<Product>) onsuccess, Function(String) onError}) async {
    String url = "$host/api/products/?search=$query";
    http.Response response = await http.get(url, headers: header);
    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      List<Product> products = List();
      jsonData.forEach((element) {
        products.add(Product.fromJson(element));
      });
      onsuccess(products);
    } else {
      onError('Đôi khi gặp một số sự cố! Vui lòng thử lại');
    }
  }

  Future<void> login(
    String username,
    String pwd, {
    Function(User) onSuccess,
    Function(String) onError,
  }) async {
    String url = "$host/api/userlogin";
    Map<String, String> body = {'user_name': username, 'password': pwd};
    http.Response response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      User user = User.fromJson(jsonData);
      onSuccess(user);
    } else {
      onError('Đôi khi gặp một số sự cố! Vui lòng thử lại');
    }
  }

  Future<void> addOrder(String param1, String param2,
      {Function onSuccess, Function onError}) async {
    String url = "$host/api/categories";
    Map<String, String> body = {'user_name': param1, 'password': param2};
    http.Response response = await http.post(url, body: json.encode(body));
    if (response.statusCode == 200) {
      dynamic jsonData = json.decode(response.body);
      User user = User.fromJson(jsonData);
      onSuccess(user);
    } else {
      onError('Đôi khi gặp một số sự cố! Vui lòng thử lại');
    }
  }
}
