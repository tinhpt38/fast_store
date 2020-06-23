import 'package:fast_store/ui/common/app_color.dart';
import 'package:flutter/material.dart';

class SearchTag extends StatefulWidget {
  final String tag;
  final Function(String) onSelect;

  SearchTag({this.tag, this.onSelect});

  @override
  _SearchTagState createState() => _SearchTagState();
}

class _SearchTagState extends State<SearchTag> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: (){
        widget.onSelect(widget.tag);
      },
          child: Container(
        margin: EdgeInsets.all(4),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
            color: AppColor.subPrimary,
            borderRadius: BorderRadius.all(Radius.circular(90))),
        child: Text(
          widget.tag,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
