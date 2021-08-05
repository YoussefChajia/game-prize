import 'package:axie_scholarship/Services/Auth.dart';
import 'package:axie_scholarship/Widgets/SignInButton.dart';
import 'package:axie_scholarship/enums/pageType.dart';
import 'package:axie_scholarship/models/pageSwitcher.dart';
import 'package:flutter/material.dart';
import 'package:axie_scholarship/models/screenSize.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage>
    with SingleTickerProviderStateMixin {
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
    return Stack(
      children: [
        Expanded(
          child: Container(
            color: Color(0xff212121),
          ),
        ),
        Positioned(
          child: SvgPicture.asset(
            "assets/Vectors/rightTail.svg",
            width: (context.read<ScreenSize>().width) * .2176,
            height: ((context.read<ScreenSize>().width) * .2176) * 1.572,
          ),
          top: 0.0,
          right: -(context.read<ScreenSize>().width) * .17,
        ),
        Positioned(
          child: SvgPicture.asset(
            "assets/Vectors/leftTail.svg",
            width: context.read<ScreenSize>().width * .3,
            height: context.read<ScreenSize>().width * .6968,
          ),
          top: -context.read<ScreenSize>().width * .6968 * .517,
          left: -(context.read<ScreenSize>().width) * .22,
        ),
        Positioned(
          child: SvgPicture.asset(
            "assets/Vectors/gifts.svg",
            width: context.read<ScreenSize>().width * 0.95,
          ),
          bottom: 0.0,
          right: context.read<ScreenSize>().width * -0.053,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInButton(
                  buttonText: "Sign Up with Email ID",
                  onPressed: () {
                    //TODO : Redirect to the page of Sign in with email and password
                    context.read<PageSwitcher>().changePage(
                          newPage: PageType.SignUpEmailPage,
                        );
                  },
                  textColor: Colors.white,
                  backgroundColor: Color(0xff514B4A)),
              SizedBox(
                height: context.read<ScreenSize>().height * .02,
              ),
              SignInButton(
                buttonText: "Sign Up with Google",
                onPressed: () async {
                  print("the sign in button is clicked");
                  await context.read<AuthService>().signInWithGoogle();
                },
                textColor: Colors.white,
                backgroundColor: Color(0xff536DFE),
              ),
              SizedBox(
                height: context.read<ScreenSize>().height * .02,
              ),
              SignInButton(
                buttonText: "Continue as a guest",
                onPressed: () {},
                backgroundColor: Color(0xff514B4A),
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
