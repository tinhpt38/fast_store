import 'package:fast_store/core/model/product.dart';
import 'package:fast_store/ui/common/app_style.dart';
import 'package:fast_store/ui/common/product_item.dart';
import 'package:fast_store/ui/modules/home/product_detail.dart';
import 'package:flutter/material.dart';

class ScrollItemList extends StatefulWidget {
  final String category;
  final List<Product> products;

  ScrollItemList({this.category, this.products});
  @override
  _ScrollItemListState createState() => _ScrollItemListState();
}

class _ScrollItemListState extends State<ScrollItemList> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.category.toUpperCase(),
            style: AppStyle.title,
          ),
        ),
        SizedBox(
          height: size.height * (1 / 3),
          child:  state()
        ),
      ],
    );
  }
  Widget state(){
    return widget.products.isEmpty ? Center(
      child: Text("Chưa có gì để hiển thị"),
    ): ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: widget.products.map((e) => ProductItem(
              product: e,
              onClick: (){
                Navigator.push(context, 
                MaterialPageRoute(
                  builder: (_) => ProductDetail(e)
                ));
              },
            )).toList()
          );
  }
}
