import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PageBase<T extends ChangeNotifier> extends StatefulWidget {

  final T model;
  final Function(BuildContext context, T model, Widget child) builder;
  final Widget child;

  PageBase({this.model, this.builder, this.child});

  @override
  _PageBaseState<T> createState() => _PageBaseState<T>();
}

class _PageBaseState<T extends ChangeNotifier> extends State<PageBase<T>> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: widget.model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}