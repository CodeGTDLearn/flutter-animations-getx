import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final String _title;
  final List<Widget> _listTabBar;
  final List<Widget> _listTabBarView;

  const CustomTabBar({
    Key? key,
    required String title,
    required List<Widget> listTabBar,
    required List<Widget> listTabBarView,
  })  : _title = title,
        _listTabBar = listTabBar,
        _listTabBarView = listTabBarView,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _listTabBar.length,
        child: Scaffold(
            appBar: AppBar(
                title: Text(_title),
                bottom: TabBar(isScrollable: true, tabs: [..._listTabBar])),
            body: SafeArea(child: TabBarView(children: [..._listTabBarView]))));
  }
}