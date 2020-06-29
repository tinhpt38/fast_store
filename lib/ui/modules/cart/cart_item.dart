import 'package:cached_network_image/cached_network_image.dart';
import 'package:fast_store/core/model/product.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  final Product product;
  final int quantity;
  final Function(int) onIncrement;
  final Function(int) onDecrement;

  CartItem({this.product, this.quantity, this.onDecrement, this.onIncrement});

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int _quantity;

  @override
  void initState() {
    _quantity = widget.quantity;
    super.initState();
  }

  _decrement() {
    if (_quantity >= 1) {
      setState(() {
        _quantity--;
      });
    }
    widget.onDecrement(_quantity);
  }

  _increment() {
    setState(() {
      _quantity++;
    });
    widget.onIncrement(_quantity);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey[100]),
      margin: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            width: 100,
            child: AspectRatio(
              aspectRatio: 1,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${widget.product.name}",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          Column(
            children: [
              FlatButton(
                onPressed: _increment,
                child: Icon(Icons.arrow_upward, size: 16),
              ),
              Text("$_quantity"),
              FlatButton(
                onPressed: _decrement,
                child: Icon(Icons.arrow_downward, size: 16),
              ),
            ],
          )
        ],
      ),
    );
  }
}
