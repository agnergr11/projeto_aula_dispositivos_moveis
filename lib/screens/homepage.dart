import 'package:flutter/material.dart';
import 'package:frases/screens/happy.dart';
import 'package:frases/screens/gado.dart';
import 'package:scaffold_tab_bar/scaffold_tab_bar.dart';
import 'package:frases/screens/sad.dart';
import 'package:frases/screens/love.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  @override
   Widget build(BuildContext context) {
     return MaterialApp(
       debugShowCheckedModeBanner: false,
      home: ScaffoldTabBar(
        children: [
          ScreenTab(
            screen:Happy(),
            tab: BottomNavigationBarItem(
              icon:  Image.asset('assets/happy.png', scale: 35,),
              title: Text('Engraçadas',style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),),
            ),
          ),
          ScreenTab(
            screen:Gado(),
            tab: BottomNavigationBarItem(
              icon: Image.asset('assets/ox.png', scale: 20 ,),
              title: Text('Corno', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),),
            ),
          ),
           ScreenTab(
            screen:SadPage(),
            tab: BottomNavigationBarItem(
              icon: Image.asset('assets/sad.png', scale: 20 ,),
              title: Text('Sofrencia', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),),
            ),
          ),
           ScreenTab(
            screen:LovePage(),
            tab: BottomNavigationBarItem(
              icon: Image.asset('assets/love.png', scale: 20 ,),
              title: Text('Romanticas', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),),
            ),
          ),
        ],
      ),
    );
  }
}