import 'package:axie_scholarship/models/game.dart';
import 'package:axie_scholarship/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameCard extends StatefulWidget {
  const GameCard({Key? key}) : super(key: key);

  @override
  _GameCardState createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: games.length,
        itemBuilder: (BuildContext context, int index) {
          final Game game = games[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: context.read<ScreenSize>().height * 0.0128),
            child: Container(
              height: context.read<ScreenSize>().height * 0.128,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Theme.of(context).cardColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: EdgeInsets.all(context.read<ScreenSize>().height * 0.0128),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: context.read<ScreenSize>().height * 0.019,
                          horizontal: context.read<ScreenSize>().width * 0.03),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                game.title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: context.read<ScreenSize>().width * 0.055,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Required : ${game.price}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: context.read<ScreenSize>().width * 0.04,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                Container(
                                  height: context.read<ScreenSize>().height * 0.045,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).buttonColor,
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: TextButton(
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all<Color>(Colors.white),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'Play',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: context.read<ScreenSize>().width * 0.042,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
