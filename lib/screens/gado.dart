import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:share/share.dart';

class Gado extends StatefulWidget {
  static const String routeName = '/Gado';
  @override
  _GadoState createState() => _GadoState();
}

class _GadoState extends State<Gado> {


  @override
  Widget build(BuildContext context) {
     return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[300],
        title: Text('Frases de Corno'),

      ),
      body: StreamBuilder(
     stream: Firestore.instance.collection("gado").snapshots(),
     builder: (BuildContext context, AsyncSnapshot snapshot){
       if(!snapshot.hasData) return const Text('Carregando..');
       return ListView.builder(
         itemCount: snapshot.data.documents.length,
         itemBuilder: (BuildContext context, int index) {
           DocumentSnapshot  doc = snapshot.data.documents[index];
           return ListTile(
             leading: Image.asset('assets/ox.png', scale: 20,),
             title: Text(doc ['g'], style: TextStyle(fontSize: 13),),
             trailing: IconButton(
               icon: Icon(Icons.share),
               onPressed: (){
                 Share.share(doc ['g']);
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