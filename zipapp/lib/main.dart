import 'package:flutter/material.dart';
//import 'home.dart';
import 'loginpage.dart';
//import 'package:flutter/foundation.dart';



Future main() async => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        primarySwatch: Colors.amber,
        //primaryColor:  defaultTargetPlatform == TargetPlatform.fuchsia ? Colors.amber[50] : null,
      ),
      home: LoginPage(),
    );
  }
}
