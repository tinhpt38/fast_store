import 'package:fast_store/core/model/product.dart';
import 'package:fast_store/ui/base/base_page.dart';
import 'package:fast_store/ui/common/search_header.dart';
import 'package:fast_store/ui/modules/home/scroll_item_list.dart';
import 'package:fast_store/ui/modules/search/search_model.dart';
import 'package:fast_store/ui/modules/search/widgets/search_tag.dart';
import 'package:flutter/material.dart';

class SeachPage extends StatefulWidget {
  final SearchModel model;

  SeachPage({this.model});
  @override
  _SeachPageState createState() => _SeachPageState();
}

class _SeachPageState extends State<SeachPage> {
  List<String> tags = [
    "iphone",
    "samsung",
    "dan cuong luc",
    "tai nghe",
    "ban phim"
  ];
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PageBase<SearchModel>(
      model: widget.model,
      builder: (contet, model, child) {
        return Scaffold(
          body: Container(
              child: Column(
            children: [
              SizedBox(
                height: size.height * (1 / 6),
                width: size.width,
                child: SearchHeader(
                  updateSearchQuery: searchQuery,
                  seachWithQuery: (query){
                    setState(() {
                      searchQuery = "";
                    });
                  },
                ),
              ),
              Visibility(
                visible: searchQuery.isEmpty,
                child: Wrap(
                  children: tags
                      .map((e) => SearchTag(
                            tag: e,
                            onSelect: (tag) {
                              setState(() {
                                searchQuery = tag;
                              });
                            },
                          ))
                      .toList(),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ScrollItemList(
                          products: List<Product>(), category: "ĐIỆN THOẠI"),
                      ScrollItemList(
                          products: List<Product>(), category: "PHỤ KIỆN"),
                      ScrollItemList(
                          products: List<Product>(), category: "LAPTOP"),
                    ],
                  ),
                ),
              ),
            ],
          )),
        );
      },
    );
  }
}
