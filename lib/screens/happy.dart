import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share/share.dart';




class Happy extends StatefulWidget {
  static const String routeName = '/happy';
  @override
  _HappyState createState() => _HappyState();
}

class _HappyState extends State<Happy> {
  @override
   Widget build(BuildContext context) {
     return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[300],
        title: Text('Frases Engraçadas'),

      ),
      body: StreamBuilder(
     stream: Firestore.instance.collection("engracadas").snapshots(),
     builder: (BuildContext context, AsyncSnapshot snapshot){
       if(!snapshot.hasData) return const Text('Carregando..');
       return ListView.builder(
         itemCount: snapshot.data.documents.length,
         itemBuilder: (BuildContext context, int index) {
           DocumentSnapshot  doc = snapshot.data.documents[index];
           return ListTile(
             leading: Image.asset('assets/happy.png', scale: 20,),
             title: Text(doc ['engracado'], style: TextStyle(fontSize: 13),),
             trailing: IconButton(
               icon: Icon(Icons.share),
               onPressed: (){
                 Share.share(doc ['engracado']);
               }
             )
           );  
         },
       );
     },
   ),
  );  
}
}