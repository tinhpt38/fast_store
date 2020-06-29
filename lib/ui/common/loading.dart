import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final String landingMessage;

  Loading({this.landingMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(90)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                offset: Offset(5, 6), blurRadius: 5, color: Colors.black38)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CircularProgressIndicator(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              landingMessage,
              style: TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
