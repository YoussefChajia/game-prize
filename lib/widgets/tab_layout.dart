import 'package:axie_scholarship/screens/game_list_screen.dart';
import 'package:flutter/material.dart';

class TabLayout extends StatelessWidget {
  const TabLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: TabBarView(
          children: [
            Container(
              color: Colors.yellow,
            ),
            GameList(),
            Container(
              color: Colors.lightGreen,
            ),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(
              icon: Icon(Icons.home),
            ),
            Tab(
              icon: Icon(Icons.rss_feed),
            ),
            Tab(
              icon: Icon(Icons.perm_identity),
            ),
          ],
          labelColor: Colors.yellow,
          unselectedLabelColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.red,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
