
import 'package:fast_store/core/model/category.dart';
import 'package:fast_store/core/model/product.dart';
import 'package:fast_store/core/services/api.dart';
import 'package:fast_store/ui/base/page_base_model.dart';
import 'package:fast_store/ui/modules/cart/cart_model.dart';
import 'package:fast_store/ui/modules/cart/cart_page.dart';
import 'package:fast_store/ui/modules/home/home_model.dart';
import 'package:fast_store/ui/modules/home/home_page.dart';
import 'package:fast_store/ui/modules/more/more_model.dart';
import 'package:fast_store/ui/modules/more/more_page.dart';
import 'package:fast_store/ui/modules/search/search_model.dart';
import 'package:fast_store/ui/modules/search/search_page.dart';
import 'package:flutter/material.dart';

class RootModel extends PageModel{
  
  HomeModel _homeModel = HomeModel();
  SearchModel _searchModel = SearchModel();
  MoreModel _moreModel = MoreModel();
  CartModel _cartModel = CartModel();
  List<Widget> _pages ;
  List<Widget> get pages => _pages;
  int _indexSelected = 0;
  int get indexSelected => _indexSelected;
  
  List<Product> _products = List();
  List<Product> get products => _products;
  List<Category> _categories = List();
  List<Category>  get categories => _categories;

  RootModel(){

    _pages =[
    HomePage(model: _homeModel),
    SeachPage(model: _searchModel),
    MorePage(model: _moreModel),
    CartPage(model: _cartModel)
  ];
  }

  updateSelectedPage(int value){
    _indexSelected = value;
    notifyListeners();
  }

  setProduct(List<Product> value){
    _products = value;
    _homeModel.setProduct(value);
    notifyListeners();
  }

  getDataFromApi()async{
    await Api().getAllProducts(
      onError: (_){},
      onsuccess: (value){
        setProduct(value);
      }
    );
  }

  
}