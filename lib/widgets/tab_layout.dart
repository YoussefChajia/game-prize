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
            Container(color: Colors.blueGrey),
            GameList(),
            Container(color: Colors.blueAccent),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: TabBar(
            tabs: [
              NavTab(icon: Icons.star_border_outlined),
              NavTab(icon: Icons.list_alt_outlined),
              NavTab(icon: Icons.person_outlined),
            ],
            labelColor: Colors.white,
            indicator: CircleTabIndicator(color: Theme.of(context).primaryColor, radius: 25),
          ),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}

class NavTab extends StatelessWidget {
  final IconData icon;

  NavTab({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Tab(
        icon: Icon(
          icon,
          size: 25.0,
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({required Color color, required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset = offset + Offset(cfg.size!.width / 2, cfg.size!.height / 2);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
