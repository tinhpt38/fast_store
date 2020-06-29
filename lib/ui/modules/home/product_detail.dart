import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_store/core/model/product.dart';
import 'package:fast_store/ui/common/app_color.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final Product product;
  final Function onBuyClick;
  ProductDetail({this.product, this.onBuyClick});

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.subPrimary,
        title: Text(
          widget.product.category.name.toUpperCase(),
          style: TextStyle(fontSize: 16),
        ),
        leading: FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              child: CachedNetworkImage(
                imageUrl: widget.product.imageUrl,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, _, __) =>
                    Center(child: Icon(Icons.error)),
                imageBuilder: (context, image) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: image,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.product.name.toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          widget.product.price.toString() + "K",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  FlatButton(
                      onPressed: () {
                        widget.onBuyClick();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        margin: EdgeInsets.symmetric(horizontal: 12),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColor.subPrimary,
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Colors.black45,
                              offset: Offset(5, 6),
                              blurRadius: 6,
                            ),
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(45),
                          ),
                        ),
                        child: Text(
                          "MUA",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                      )),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    child: Text("THÔNG TIN CHI TIẾT",
                        style: TextStyle(fontSize: 16)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.product.description),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
