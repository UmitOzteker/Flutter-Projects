import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class BottomBarPage extends StatefulWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  final _firestore = FirebaseFirestore.instance;
  TextEditingController yorumController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CollectionReference yorumlarRef = _firestore.collection("Yorumlar");
    return Column(
      children: [
        StreamBuilder<QuerySnapshot>(
            stream: yorumlarRef.snapshots(),
            builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
              List<DocumentSnapshot> listofDocumentSnap =
                  asyncSnapshot.data.docs;
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: listofDocumentSnap.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text("Yorumlar"),
                      ),
                    );
                  });
            }),
        TextField(
          controller: yorumController,
          decoration: InputDecoration(hintText: "Yorum Yazınız"),
        )
      ],
    );
  }
}
