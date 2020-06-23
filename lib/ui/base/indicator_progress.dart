import 'package:flutter/material.dart';



class IndicatorProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Đang tải dữ liệu vui lòng đợi"),
        )
      ],
    );
  }
}