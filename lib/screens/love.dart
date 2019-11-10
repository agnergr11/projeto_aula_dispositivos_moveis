import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share/share.dart';


class LovePage extends StatefulWidget {
  static const String routeName = '/love';
  @override
  _LovePageState createState() => _LovePageState();
}

class _LovePageState extends State<LovePage> {
  @override
  Widget build(BuildContext context) {
     return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[300],
        title: Text('Frases Romanticas'),

      ),
      body: StreamBuilder(
     stream: Firestore.instance.collection("romanticas").snapshots(),
     builder: (BuildContext context, AsyncSnapshot snapshot){
       if(!snapshot.hasData) return const Text('Carregando..');
       return ListView.builder(
         itemCount: snapshot.data.documents.length,
         itemBuilder: (BuildContext context, int index) {
           DocumentSnapshot  doc = snapshot.data.documents[index];
           return ListTile(
             leading: Image.asset('assets/love.png', scale: 20,),
             title: Text(doc ['a'], style: TextStyle(fontSize: 13),),
             trailing: IconButton(
               icon: Icon(Icons.share),
               onPressed: (){
                 Share.share(doc ['a']);
               }
             ),
           );  
         },
       );
     },
   ),
  );  
}
}