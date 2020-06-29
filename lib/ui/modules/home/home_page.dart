import 'package:fast_store/ui/base/base_page.dart';
import 'package:fast_store/ui/base/indicator_progress.dart';
import 'package:fast_store/ui/common/search_header.dart';
import 'package:fast_store/ui/modules/home/home_model.dart';
import 'package:fast_store/ui/modules/home/scroll_item_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final HomeModel model;

  HomePage({this.model});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String query = "";
  DateTime willPopTimeRef;

  Future<void> onRefresh() async {
    await widget.model.getDataFromApi();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await onRefresh();
    });
  }

  Future<bool> onWillPopScope() async {
    DateTime now = DateTime.now();
    if (willPopTimeRef == null ||
        now.difference(willPopTimeRef) > Duration(milliseconds: 500)) {
      willPopTimeRef = now;
      await onRefresh();
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return PageBase<HomeModel>(
      model: widget.model,
      builder: (context, model, child) {
        return Scaffold(
          body: WillPopScope(
            onWillPop: onWillPopScope,
            child: Container(
                child: Column(
              children: [
                SizedBox(
                  height: size.height * (1 / 6),
                  width: size.width,
                  child: SearchHeader(
                    updateSearchQuery: query,
                    seachWithQuery: (query) async {
                      await model.search(query);
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    child: RefreshIndicator(
                      onRefresh: onRefresh,
                      child: model.busy
                          ? IndicatorProgress()
                          : SingleChildScrollView(
                              physics: BouncingScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: model.categories.map((e) {
                                  return ScrollItemList(
                                    category: e.name,
                                    products: model.productFormCategory(e.id),
                                    onBuyClick: (product) {
                                      model.onBuyClick(product);
                                    },
                                  );
                                }).toList(),
                              ),
                            ),
                    ),
                  ),
                ),
              ],
            )),
          ),
        );
      },
    );
  }
}
