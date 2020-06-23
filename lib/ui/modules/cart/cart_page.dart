import 'package:fast_store/ui/base/base_page.dart';
import 'package:fast_store/ui/common/search_header.dart';
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
    Size size = MediaQuery.of(context).size;
    return PageBase<CartModel>(
      model: widget.model,
      builder: (context, model, child) {
        return Scaffold(
          body: Container(
            child: Column(
              children: [
                  SizedBox(
                  height: size.height * (1/6),
                  width: size.width,
                  child: SearchHeader(),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
