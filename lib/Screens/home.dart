import 'package:axie_scholarship/Services/Auth.dart';
import 'package:axie_scholarship/Widgets/circleButton.dart';
import 'package:axie_scholarship/models/screenSize.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("You're now signed in");
    return Center(
        child: CircleButton(
      assetPath: "assets/Icons/signOut.svg",
      fillColor: Color(0xff212121),
      iconColor: Colors.white,
      onPressed: () async {
        await context.read<AuthService>().signOut();
      },
    ));
  }
}
