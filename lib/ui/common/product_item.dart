import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_store/core/model/product.dart';
import 'package:fast_store/core/singletone/cart_store.dart';
import 'package:fast_store/ui/common/app_color.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  final Function onClick;

  ProductItem({this.product, this.onClick});

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black45, offset: Offset(3, 6), blurRadius: 5)
          ]),
      child: FlatButton(
        onPressed: widget.onClick,
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Column(
                children: [
                  Expanded(
                    flex: 2,
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
                            // colorFilter: ColorFilter.mode(
                            //     Colors.red, BlendMode.colorBurn)
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        CartStore.addProduct(widget.product);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColor.subPrimary,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(5, 6),
                                  blurRadius: 5)
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(45))),
                        child: Text(
                          widget.product.price.toString().toUpperCase() + "K",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: false,
              child: Positioned(
                right: -10,
                top: 0,
                child: Container(
                    alignment: Alignment.topRight,
                    child: ImageIcon(
                      AssetImage("assets/banner.png"),
                      color: Colors.yellow[100],
                      size: 64,
                    )),
              ),
            ),
            Visibility(
              visible: false,
              child: Positioned(
                right: 0,
                top: 10,
                child: Text(
                  "-50%",
                  style: TextStyle(color: AppColor.subPrimary, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
