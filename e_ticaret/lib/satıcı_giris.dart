import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret/bottombar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class GirisPage extends StatefulWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  State<GirisPage> createState() => _GirisPageState();
}

class _GirisPageState extends State<GirisPage> {
  final _firestore = FirebaseFirestore.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController fiyatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CollectionReference urunlerRef = _firestore.collection("Urunler");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("e-ticaret"),
        ),
        body: Flexible(
          child: Column(children: [
            StreamBuilder<QuerySnapshot>(
                stream: urunlerRef.snapshots(),
                builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
                  List<DocumentSnapshot> listofDocumentSnap =
                      asyncSnapshot.data.docs;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: listofDocumentSnap.length,
                    itemBuilder: (context, index) {
                      return Card(
                          child: ListTile(
                        title: Text("${listofDocumentSnap[index]["Name"]}"),
                      ));
                    },
                  );
                }),
                 Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 200),
                child: Form(
                    child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration:
                          InputDecoration(hintText: "Ürün Adı Giriniz"),
                    ),
                    TextFormField(
                      controller: fiyatController,
                      decoration: InputDecoration(hintText: "Fiyat Giriniz"),
                    ),
                  ],
                )),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Map<String, dynamic> bilgisayarData = {
              "Name": nameController.text,
              "Fiyat": fiyatController.text
            };
            await urunlerRef.doc(nameController.text).set(bilgisayarData);
          },
          child: Text("Ekle"),
        ),
      ),
    );
  }
}