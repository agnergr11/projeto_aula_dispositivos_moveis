import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SadPage extends StatefulWidget {
  static const String routeName = '/sadpage';
  @override
  _SadPageState createState() => _SadPageState();
}

class _SadPageState extends State<SadPage> {
  
  @override
  Widget build(BuildContext context) {
     return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text('Frases de Sofrência'),

      ),
      body: StreamBuilder(
     stream: Firestore.instance.collection("sofrencia").snapshots(),
     builder: (BuildContext context, AsyncSnapshot snapshot){
       if(!snapshot.hasData) return const Text('Carregando..');
       return ListView.builder(
         itemCount: snapshot.data.documents.length,
         itemBuilder: (BuildContext context, int index) {
           DocumentSnapshot  doc = snapshot.data.documents[index];
           return ListTile(
             leading: Image.asset('assets/sad.png', scale: 20,),
             title: Text(doc ['s'], style: TextStyle(fontSize: 13),),
             trailing: GestureDetector(
               onTap: (){ 
              
               },
                child: Icon(Icons.share, color: Colors.grey,),
               ),
           );  
         },
       );
     },
   ),
  );  
}
}