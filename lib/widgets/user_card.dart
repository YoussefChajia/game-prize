import 'package:axie_scholarship/models/user.dart';
import 'package:axie_scholarship/tools/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserCard extends StatefulWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          final User user = users[index];
          if (index >= 3) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: context.read<ScreenSize>().height * 0.0128),
              child: Container(
                height: context.read<ScreenSize>().height * 0.105,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  color: Theme.of(context).cardColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(context.read<ScreenSize>().height * 0.0128),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: context.read<ScreenSize>().height * 0.08,
                            width: context.read<ScreenSize>().height * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.0),
                              color: Colors.black,
                            ),
                            child: Icon(
                              Icons.person_outline,
                              color: Theme.of(context).cardColor,
                              size: context.read<ScreenSize>().width * 0.08,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: context.read<ScreenSize>().width * 0.035),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    user.username,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: context.read<ScreenSize>().width * 0.045,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: context.read<ScreenSize>().height * 0.015,
                                  ),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Score : ${user.score}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: context.read<ScreenSize>().width * 0.04,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      SizedBox(
                                        width: context.read<ScreenSize>().width * 0.01,
                                      ),
                                      Icon(
                                        Icons.circle_outlined,
                                        size: context.read<ScreenSize>().width * 0.04,
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
                    Padding(
                      padding: EdgeInsets.all(context.read<ScreenSize>().height * 0.025),
                      child: Container(
                        height: context.read<ScreenSize>().height * 0.05,
                        width: context.read<ScreenSize>().height * 0.05,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Theme.of(context).buttonColor,
                        ),
                        child: Center(
                          child: Text(
                            user.rank.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: context.read<ScreenSize>().width * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
