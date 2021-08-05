import 'dart:async';

import 'package:axie_scholarship/Screens/decideWidget.dart';
import 'package:axie_scholarship/Services/Auth.dart';
import 'package:axie_scholarship/enums/pageType.dart';
import 'package:axie_scholarship/models/pageSwitcher.dart';
import 'package:axie_scholarship/models/screenSize.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  User? user;
  @override
  Widget build(BuildContext context) {
    AuthService _authService = AuthService();
    PageSwitcher _pageSwitcher = PageSwitcher();
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => _authService,
        ),
        Provider<PageSwitcher>(create: (_) => _pageSwitcher),
        StreamProvider<PageType>(
          create: (context) => context.read<PageSwitcher>().pageType,
          initialData: PageType.LoginPage,
        ),
        StreamProvider<User?>(
          create: (context) => context.read<AuthService>().authStateChanges,
          initialData: AuthService().currentUser,
        ),
        Provider<ScreenSize>(
          create: (_) => ScreenSize(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        )
      ],
      child: Scaffold(
        body: LoginOrHome(),
      ),
    );
  }
}
