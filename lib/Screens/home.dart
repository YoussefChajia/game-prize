import 'package:axie_scholarship/Services/Auth.dart';
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
        child: RawMaterialButton(
      constraints: BoxConstraints(
        minHeight: context.read<ScreenSize>().width * .116,
        minWidth: context.read<ScreenSize>().width * .116,
      ),
      onPressed: () async {
        await context.read<AuthService>().signOut();
      },
      elevation: 0.0,
      fillColor: Color(0xff212121),
      child: SvgPicture.asset(
        "assets/Icons/signOut.svg",
        color: Colors.white,
        width: context.read<ScreenSize>().width * .045,
        height: context.read<ScreenSize>().width * .045,
      ),
      padding: EdgeInsets.all(15.0),
      shape: CircleBorder(),
    ));
  }
}
