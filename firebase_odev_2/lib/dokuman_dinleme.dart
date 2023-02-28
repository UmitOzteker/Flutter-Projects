import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(DokumanDinleme());
}

class DokumanDinleme extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final _firestore = FirebaseFirestore.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    CollectionReference moviesRef = _firestore.collection("movies");
    var batmanRef = moviesRef.doc("Batman");
    return MaterialApp(
        title: 'TextButton Demo',
        home: Scaffold(
            backgroundColor: Colors.blue,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text('TextButton Demo'),
            ),
            body: Column(
              children: [
                StreamBuilder<DocumentSnapshot>(
                  stream: batmanRef.snapshots(),
                  builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
                    return Text(
                      "${asyncSnapshot.data.data()}",
                      style: TextStyle(fontSize: 24),
                    );
                  },
                )
              ],
            )));
  }
}