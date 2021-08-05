import 'package:axie_scholarship/widgets/game_card.dart';
import 'package:flutter/material.dart';

class GameList extends StatefulWidget {
  const GameList({Key? key}) : super(key: key);

  @override
  _GameListState createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 35.0),
                  child: Text(
                    'Hello,\nYoussef Chajia',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.0),
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
                SizedBox(height: 10.0),
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
      height: 40.0,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 13.0),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
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
