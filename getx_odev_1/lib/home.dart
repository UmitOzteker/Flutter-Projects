import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Home extends StatelessWidget {
final _firestore = FirebaseFirestore.instance;
   

  @override
  Widget build(BuildContext context) {
    CollectionReference userRef = _firestore.collection("User");
    return Scaffold(
      body: Flexible(
          child: Column(children: [
              StreamBuilder<QuerySnapshot>(
                stream: userRef.snapshots(),
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
                            "${listofDocumentSnap[index]["email"]}",
                            style: TextStyle(fontSize: 24),
                          ),
                          subtitle: Text(
                            "${listofDocumentSnap[index]["password"]}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
          ])));}}