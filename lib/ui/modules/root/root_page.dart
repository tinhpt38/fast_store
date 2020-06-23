import 'package:fast_store/ui/base/base_page.dart';
import 'package:fast_store/ui/base/indicator_progress.dart';
import 'package:fast_store/ui/common/app_color.dart';
import 'package:fast_store/ui/modules/root/root_model.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  final bool isAdmin;
  RootPage(this.isAdmin);
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  RootModel _model;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _model.getDataFromApi();
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageBase<RootModel>(
      model: RootModel(),
      builder: (context, model, child) {
        _model = model;
        return Scaffold(
          backgroundColor: AppColor.subPrimary,
          body: model.busy
              ? IndicatorProgress()
              : model.pages[model.indexSelected],
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: AppColor.subPrimary,
                primaryColor: Colors.white,
                textTheme: Theme.of(context)
                    .textTheme
                    .copyWith(caption: new TextStyle(color: Colors.yellow))), //
            child: BottomNavigationBar(
              onTap: model.updateSelectedPage,
              currentIndex: model.indexSelected,
              items: [
                //home
                BottomNavigationBarItem(
                  title: Text("Home"),
                  icon: Icon(
                    Icons.home,
                    color: AppColor.primary,
                  ),
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                ),

                //search
                BottomNavigationBarItem(
                  title: Text("Search"),
                  icon: Icon(
                    Icons.search,
                    color: AppColor.primary,
                  ),
                  activeIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                //more
                BottomNavigationBarItem(
                  title: Text("More"),
                  icon: Icon(
                    Icons.more_horiz,
                    color: AppColor.primary,
                  ),
                  activeIcon: Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ),
                ),
                //person
                BottomNavigationBarItem(
                  title: Text("Cart"),
                  icon: Icon(
                    Icons.shopping_cart,
                    color: AppColor.primary,
                  ),
                  activeIcon: Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
