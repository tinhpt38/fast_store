import 'package:flutter/material.dart';

class AppField extends StatelessWidget {
  final TextEditingController controller;
  final String hinText;
  final TextInputType type;
  final IconData icon;
  final bool obscureText;

  AppField(
      {this.controller,
      this.hinText,
      this.type = TextInputType.text,
      this.icon,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        style: TextStyle(
            color: Colors.grey[800], fontSize: 14, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
            icon: Icon(
              icon,
              color: Colors.grey,
            ),
            hintText: hinText,
            hintStyle: TextStyle(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
