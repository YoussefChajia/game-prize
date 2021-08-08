import 'package:axie_scholarship/models/user.dart';
import 'package:axie_scholarship/tools/screen_size.dart';
import 'package:axie_scholarship/tools/triangle_painter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User user = User(
      username: 'Youssef Chajia',
      rank: 4,
      score: 1900,
      balance: 200,
      email: 'youssefchajia@example.com');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              children: [
                Container(
                  height: context.read<ScreenSize>().height * 0.2,
                  width: context.read<ScreenSize>().width,
                  decoration: BoxDecoration(color: Theme.of(context).buttonColor),
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.all(context.read<ScreenSize>().height * 0.02),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Theme.of(context).backgroundColor,
                      child: IconButton(
                        icon: Icon(
                          Icons.logout_rounded,
                        ),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: context.read<ScreenSize>().width * 0.055,
                      top: context.read<ScreenSize>().height * 0.15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: context.read<ScreenSize>().height * 0.15,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Icon(
                                  Icons.person_outline,
                                  color: Theme.of(context).backgroundColor,
                                  size: context.read<ScreenSize>().width * 0.12,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Theme.of(context).backgroundColor,
                                  child: IconButton(
                                    icon: Icon(Icons.photo_camera),
                                    iconSize: context.read<ScreenSize>().width * 0.055,
                                    color: Colors.white,
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.read<ScreenSize>().width * 0.04,
                            vertical: 10.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      user.username,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: context.read<ScreenSize>().width * 0.055,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                    ),
                                    color: Colors.white,
                                    iconSize: context.read<ScreenSize>().width * 0.04,
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                              Text(
                                user.email,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: context.read<ScreenSize>().width * 0.04,
                                  fontWeight: FontWeight.normal,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: context.read<ScreenSize>().height * 0.035,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.read<ScreenSize>().width * 0.055),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: context.read<ScreenSize>().width * 0.04),
                    child: Text(
                      'Balance : ${user.balance}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: context.read<ScreenSize>().width * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: context.read<ScreenSize>().height * 0.035,
                        width: context.read<ScreenSize>().width / 3,
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            'Your first win',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.read<ScreenSize>().width * 0.035,
                              fontWeight: FontWeight.normal,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.read<ScreenSize>().width * 0.11),
              child: Container(
                height: context.read<ScreenSize>().height * 0.015,
                width: context.read<ScreenSize>().width * 0.05,
                child: CustomPaint(
                  painter: TrianglePainter(
                    color: Theme.of(context).cardColor,
                    paintingStyle: PaintingStyle.fill,
                  ),
                ),
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.read<ScreenSize>().width * 0.055,
                    vertical: context.read<ScreenSize>().height * 0.02,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: LinearProgressIndicator(
                      value: 0.75,
                      backgroundColor: Theme.of(context).cardColor,
                      color: Theme.of(context).primaryColor,
                      minHeight: context.read<ScreenSize>().height * 0.05,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: context.read<ScreenSize>().width * 0.1,
                      vertical: context.read<ScreenSize>().height * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Only 450 of score left',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: context.read<ScreenSize>().width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Icon(
                        Icons.emoji_events,
                        color: Colors.yellow[800],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.read<ScreenSize>().width * 0.055,
                  vertical: context.read<ScreenSize>().height * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: context.read<ScreenSize>().width * 0.055,
                          color: Colors.white,
                          fontWeight: FontWeight.normal,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Increase your balance for'),
                          TextSpan(
                            text: ' FREE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: context.read<ScreenSize>().width * 0.05,
                  ),
                  Expanded(
                    child: Container(
                      height: context.read<ScreenSize>().height * 0.075,
                      decoration: BoxDecoration(
                        color: Theme.of(context).buttonColor,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Watch an Ad',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: context.read<ScreenSize>().width * 0.045,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.read<ScreenSize>().width * 0.055),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: context.read<ScreenSize>().height * 0.055,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.read<ScreenSize>().width * 0.06,
                    ),
                    child: Text(
                      'How it works',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: context.read<ScreenSize>().width * 0.045,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: context.read<ScreenSize>().height * 0.055,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.read<ScreenSize>().width * 0.11,
                    ),
                    child: Text(
                      'Rate Us',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: context.read<ScreenSize>().width * 0.045,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
