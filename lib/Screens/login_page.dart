import 'package:axie_scholarship/Services/Auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage>
    with SingleTickerProviderStateMixin {
  double? screenWidth, screenHeight;
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
    if (this.screenWidth == null) {
      this.screenWidth = MediaQuery.of(context).size.width;
      this.screenHeight = MediaQuery.of(context).size.height;
      setState(() {});
    }
    return Center(
      child: Column(
        children: [
          MaterialButton(
            height: (screenHeight ?? 200) * .02,
            minWidth: (screenWidth ?? 200) * .01,
            color: Color(0xff536DFE),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Container(
              width: (screenWidth ?? 200) * .36,
              height: (screenHeight ?? 200) * .04,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Sing in with google",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            onPressed: () async {
              print("the sign in button is clicked");
              await context.read<AuthService>().signInWithGoogle();
            },
          )
        ],
      ),
    );
  }
}
