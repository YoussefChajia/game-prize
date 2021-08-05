import 'package:axie_scholarship/models/game.dart';
import 'package:flutter/material.dart';

class GameCard extends StatefulWidget {
  const GameCard({Key? key}) : super(key: key);

  @override
  _GameCardState createState() => _GameCardState();
}

class _GameCardState extends State<GameCard> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: games.length,
        itemBuilder: (BuildContext context, int index) {
          final Game game = games[index];
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Theme.of(context).cardColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 85.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            game.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                game.price.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Container(
                                height: 30.0,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).buttonColor,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: TextButton(
                                  style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                  ),
                                  onPressed: () {},
                                  child: Text('Play'),
                                ),
                              ),
                            ],
                          ),
                        ],
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
