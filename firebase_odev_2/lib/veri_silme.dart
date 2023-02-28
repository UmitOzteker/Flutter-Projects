import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(VeriSilme());
}

class VeriSilme extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final _firestore = FirebaseFirestore.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
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
                StreamBuilder<QuerySnapshot>(
                  stream: moviesRef.snapshots(),
                  builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
                    List<DocumentSnapshot> listofDocumentSnap =
                        asyncSnapshot.data.docs;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: listofDocumentSnap.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                              title: Text(
                                "${listofDocumentSnap[index]["name"]}",
                                style: TextStyle(fontSize: 24),
                              ),
                              subtitle: Text(
                                "${listofDocumentSnap[index]["year"]}",
                                style: TextStyle(fontSize: 16),
                              ),
                              trailing: IconButton(icon:Icon(Icons.delete), onPressed: ()async { 
                                await listofDocumentSnap[index].reference.delete();
                               },),
                              ),
                        );
                      },
                    );
                  },
                )
              ],
            )));
  }
}