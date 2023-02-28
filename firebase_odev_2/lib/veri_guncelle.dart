import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(VeriGuncelle());
}

class VeriGuncelle extends StatefulWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  final _firestore = FirebaseFirestore.instance;
  @override
  State<VeriGuncelle> createState() => _VeriSilmeState();
}

class _VeriSilmeState extends State<VeriGuncelle> {
  final _firestore = FirebaseFirestore.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController yearController = TextEditingController();

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
        body: Flexible(
          child: Column(
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
                        ),
                      );
                    },
                  );
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 200),
                child: Form(
                    child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      decoration:
                          InputDecoration(hintText: "Film Adını Giriniz"),
                    ),
                    TextFormField(
                      controller: yearController,
                      decoration: InputDecoration(hintText: "Yıl Giriniz"),
                    ),
                  ],
                )),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Map<String, dynamic> movieData = {
              "name": nameController.text,
              "year": yearController.text
            };
            await moviesRef.doc(nameController.text).update({"rating":"3.1"});
            await moviesRef.doc(nameController.text).update({"name":""});
          },
          child: Text("Ekle"),
        ),
      ),
    );
  }
}