import 'package:flutter/material.dart';
import 'package:frases/screens/gado.dart';
import 'package:frases/screens/homepage.dart';
import 'package:frases/screens/happy.dart';
import 'package:frases/screens/sad.dart';
import 'package:frases/screens/love.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diet',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
      Happy.routeName: (context) => new Happy(), 
      Gado.routeName: (context) => new Gado(),      
      HomePage.routeName: (context) => new HomePage(),
      SadPage.routeName: (context) => new SadPage(),
      LovePage.routeName: (context) => new LovePage(),
      },
      home: HomePage(),
    );
  }
}
