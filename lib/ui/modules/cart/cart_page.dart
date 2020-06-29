import 'package:fast_store/core/singletone/cart_store.dart';
import 'package:fast_store/ui/base/base_page.dart';
import 'package:fast_store/ui/common/app_color.dart';
import 'package:fast_store/ui/modules/cart/cart_item.dart';
import 'package:fast_store/ui/modules/cart/cart_model.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final CartModel model;
  CartPage({this.model});
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return PageBase<CartModel>(
      model: widget.model,
      builder: (context, model, child) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Giỏ hàng của bạn"),
              centerTitle: true,
              backgroundColor: AppColor.subPrimary,
            ),
            body: Container(
              child: ListView(
                children: model.products
                    .asMap()
                    .map((key, product) => MapEntry(
                          product,
                          Container(
                              child: CartItem(
                            product: product,
                            quantity:
                                model.quantityOfProduct[product.id.toString()],
                            onDecrement: (value) {
                              CartStore.changeQuantity(
                                  product.id.toString(), value);
                            },
                            onIncrement: (value) {
                              CartStore.changeQuantity(
                                  product.id.toString(), value);
                            },
                          )),
                        ))
                    .values
                    .toList(),
              ),
            ));
      },
    );
  }
}
