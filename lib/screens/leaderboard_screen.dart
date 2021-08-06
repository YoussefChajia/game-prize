import 'package:axie_scholarship/tools/screen_size.dart';
import 'package:axie_scholarship/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: context.read<ScreenSize>().height * 0.3,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.read<ScreenSize>().width * 0.055,
                    vertical: context.read<ScreenSize>().height * 0.035,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TopCard(
                        rank: 2,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: context.read<ScreenSize>().height * 0.06,
                            width: context.read<ScreenSize>().height * 0.1,
                            child: Image.asset('assets/images/crown.png'),
                          ),
                          Container(
                            height: context.read<ScreenSize>().height * 0.12,
                            width: context.read<ScreenSize>().height * 0.12,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Colors.black,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '1450',
                                style:
                                    TextStyle(fontSize: context.read<ScreenSize>().width * 0.045),
                              ),
                              SizedBox(
                                width: context.read<ScreenSize>().width * 0.01,
                              ),
                              Icon(
                                Icons.circle_outlined,
                                size: context.read<ScreenSize>().width * 0.04,
                              ),
                            ],
                          )
                        ],
                      ),
                      TopCard(
                        rank: 3,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: context.read<ScreenSize>().height * 0.0128,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: context.read<ScreenSize>().width * 0.055),
                child: UserCard(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TopCard extends StatelessWidget {
  final int rank;

  const TopCard({Key? key, required this.rank}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40.0),
              child: Container(
                height: context.read<ScreenSize>().height * 0.12,
                width: context.read<ScreenSize>().height * 0.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Colors.black,
                ),
              ),
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: context.read<ScreenSize>().height * 0.07,
                  width: context.read<ScreenSize>().height * 0.07,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Theme.of(context).cardColor,
                  ),
                ),
                Container(
                  height: context.read<ScreenSize>().height * 0.06,
                  width: context.read<ScreenSize>().height * 0.06,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Theme.of(context).buttonColor,
                  ),
                  child: Center(
                    child: Text(
                      rank.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: context.read<ScreenSize>().width * 0.06,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: context.read<ScreenSize>().height * 0.015),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '1450',
              style: TextStyle(fontSize: context.read<ScreenSize>().width * 0.045),
            ),
            SizedBox(
              width: context.read<ScreenSize>().width * 0.01,
            ),
            Icon(
              Icons.circle_outlined,
              size: context.read<ScreenSize>().width * 0.04,
            ),
          ],
        )
      ],
    );
  }
}
