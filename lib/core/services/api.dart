import 'dart:convert';

import 'package:fast_store/core/model/category.dart';
import 'package:fast_store/core/model/product.dart';
import 'package:http/http.dart' as http;

class Api{
  
  static final Api _instance = Api._internal();
  factory Api() => _instance;
  Api._internal();

  Map<String, String> header = {
    "Content-Type": "application/json"
  };

  Future<void> getAllProducts(
    {Function(List<Product>) onsuccess,
    Function(String) onError}
  ) async{
    String url = "http://faststores.azurewebsites.net/api/products";
      http.Response response = await http.get(url, headers: header);
    if(response.statusCode == 200){
      dynamic jsonData = json.decode(response.body);
      List<Product> products = List();
      jsonData.forEach((element) { 
        products.add(Product.fromJson(element));
      });
      
      onsuccess(products);
    }else{
      onError('Đôi khi gặp một số sự cố! Vui lòng thử lại');
    }
  }

  Future<void> getCategory(
    {Function(List<Category>) onSuccess,
    Function(String) onError}
  )async{
    const String url = "http://faststores.azurewebsites.net/api/categories";
      http.Response response = await http.get(url, headers: header);
    if(response.statusCode == 200){
      dynamic jsonData = json.decode(response.body);
      List<Category> categories = List();
      jsonData.forEach((element) { 
        categories.add(Category.fromJson(element));
      });
      onSuccess(categories);
    }else{
      onError('Đôi khi gặp một số sự cố! Vui lòng thử lại');
    }
  }


  Future<void> search(
    String query,
    {Function(List<Product>) onsuccess,
    Function(String) onError}
  ) async{
    String url = "http://faststores.azurewebsites.net/api/products/?search=$query";
      http.Response response = await http.get(url, headers: header);
    if(response.statusCode == 200){
      dynamic jsonData = json.decode(response.body);
      List<Product> products = List();
      jsonData.forEach((element) { 
        products.add(Product.fromJson(element));
      });
      onsuccess(products);
    }else{
      onError('Đôi khi gặp một số sự cố! Vui lòng thử lại');
    }
  }

}