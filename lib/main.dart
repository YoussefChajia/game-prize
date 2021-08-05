import 'package:axie_scholarship/widgets/tab_layout.dart';
import 'package:flutter/material.dart';

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
      home: TabLayout(),
    );
  }
}
