import 'package:axie_scholarship/tools/screen_size.dart';
import 'package:axie_scholarship/widgets/game_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameListPage extends StatefulWidget {
  const GameListPage({Key? key}) : super(key: key);

  @override
  _GameListPageState createState() => _GameListPageState();
}

class _GameListPageState extends State<GameListPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.read<ScreenSize>().width * 0.055),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: context.read<ScreenSize>().height * 0.05),
                  child: Text(
                    'Hello,\nYoussef Chajia',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: context.read<ScreenSize>().width * 0.07,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: context.read<ScreenSize>().height * 0.025),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: context.read<ScreenSize>().width * 0.03),
                        child: InfoCard(
                          text: 'Score :',
                        ),
                      ),
                    ),
                    Expanded(
                      child: InfoCard(text: 'Balance : '),
                    ),
                  ],
                ),
                SizedBox(height: context.read<ScreenSize>().height * 0.015),
                GameCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String text;

  InfoCard({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.read<ScreenSize>().height * 0.05,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: context.read<ScreenSize>().height * 0.013,
            horizontal: context.read<ScreenSize>().width * 0.035),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: context.read<ScreenSize>().width * 0.044,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
