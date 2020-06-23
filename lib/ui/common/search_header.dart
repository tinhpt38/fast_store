import 'package:fast_store/ui/common/app_color.dart';
import 'package:flutter/material.dart';

class SearchHeader extends StatefulWidget {
  final Function(String) seachWithQuery;
  final String updateSearchQuery;

  SearchHeader({this.seachWithQuery, this.updateSearchQuery});
  @override
  _SearchHeaderState createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {


  TextEditingController searchCottler = TextEditingController();

  onSeachClick(){
    widget.seachWithQuery(searchCottler.text);
    searchCottler.clear();
  }

  @override
  void initState() {
    searchCottler.text = widget.updateSearchQuery;
    super.initState();
  }

  @override
  void didUpdateWidget(Widget oldWidget){
    if(oldWidget != widget){
      setState(() {
      searchCottler.text = widget.updateSearchQuery;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.subPrimary,
      child: Row(
        children: [
          Flexible(
            flex: 5,
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                controller: searchCottler,
                maxLines: 1,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(90)))),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              child: FlatButton(
                onPressed: onSeachClick,
                color: AppColor.subPrimary,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.search,
                    color: AppColor.primary,
                    size: 42,
                  ),
                ),
              )
            ),
          ),
        ],
      ),
    );
  }
}
