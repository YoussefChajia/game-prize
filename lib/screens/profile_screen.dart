import 'package:axie_scholarship/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Column(
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
                                      'Youssef Chajia',
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
                                'youssefchajia@example.com',
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
            //Next Move
          ],
        ),
      ),
    );
  }
}
