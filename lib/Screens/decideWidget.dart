import 'package:axie_scholarship/Screens/home.dart';
import 'package:axie_scholarship/Screens/login_page.dart';
import 'package:axie_scholarship/Screens/signInEmail.dart';
import 'package:axie_scholarship/Screens/signUpEmail.dart';
import 'package:axie_scholarship/enums/pageType.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginOrHome extends StatefulWidget {
  const LoginOrHome({Key? key}) : super(key: key);

  @override
  LoginOrHomeState createState() => LoginOrHomeState();
}

class LoginOrHomeState extends State<LoginOrHome> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User? user = context.watch<User?>();
    context.watch<PageType>();
    if (user == null) {
      if (context.read<PageType>() == PageType.LoginPage) return SignInPage();
      if (context.read<PageType>() == PageType.SignUpEmailPage)
        return SignUpEmailPage();
      return SignInEmailPage();
    }
    return HomePage();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
