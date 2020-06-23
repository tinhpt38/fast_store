import 'package:fast_store/ui/base/base_page.dart';
import 'package:fast_store/ui/common/search_header.dart';
import 'package:fast_store/ui/modules/more/more_model.dart';
import 'package:flutter/material.dart';

class MorePage extends StatefulWidget {

  final MoreModel model;
  MorePage({this.model});
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PageBase<MoreModel>(
      model: widget.model,
      builder: (context, model, child){
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
            )
          ),
        );
      },
    );
  }
}