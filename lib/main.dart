import 'package:axie_scholarship/tools/screen_size.dart';
import 'package:axie_scholarship/widgets/tab_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Axie Scholarship',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFE64A19),
        cardColor: Color(0xFF514B4A),
        buttonColor: Color(0xFF536DFE),
        backgroundColor: Color(0xFF212121),
        brightness: Brightness.dark,
      ),
      home: MyHomePage(
        title: 'Axie Scholarship Home Page',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ScreenSize>(
          create: (_) => ScreenSize(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
        )
      ],
      child: Scaffold(
        body: TabLayout(),
      ),
    );
  }
}
