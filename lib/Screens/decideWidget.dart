import 'package:axie_scholarship/Screens/home.dart';
import 'package:axie_scholarship/Screens/login_page.dart';
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
    if (user == null) {
      return SignInPage();
    }
    return HomePage();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
