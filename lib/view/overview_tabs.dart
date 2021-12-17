import 'package:flutter/material.dart';

import 'anim_container.dart';

class OverviewTabs extends StatelessWidget {
  String title = "";

  OverviewTabs({required this.title});

  @override
  Widget build(BuildContext context) {
    var animeContainer = 'AnimeContainer';
    var _title = 'That are the Animations:';

    return DefaultTabController(
        length: 1,
        child: Scaffold(
          appBar: AppBar(
              title: Text(_title),
              bottom: TabBar(tabs: [
                Tab(
                  icon: const Icon(Icons.directions_car),
                  text: animeContainer,
                ),
              ])),
          body: TabBarView(
            children: [
              AnimContainer(title: animeContainer),
            ],
          ),
        ));
  }
}