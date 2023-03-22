import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret/bottombar.dart';
import 'package:e_ticaret/ekle.dart';
import 'package:e_ticaret/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SaticiGirisPage extends StatefulWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final _firestore = FirebaseFirestore.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  State<SaticiGirisPage> createState() => _SaticiGirisPageState();
}

class _SaticiGirisPageState extends State<SaticiGirisPage> {
  final _firestore = FirebaseFirestore.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController fiyatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference urunlerRef = _firestore.collection("urunler");
    var bilgisayarRef = urunlerRef.doc("hpvictus");
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("e-ticaret"),
        ),
        body: Container(
          child: StreamBuilder<QuerySnapshot>(
              stream: urunlerRef.snapshots(),
              builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
                List<DocumentSnapshot> listofDocumentSnap =
                    asyncSnapshot.data.docs;
                return Row(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: listofDocumentSnap.length,
                        itemBuilder: (context, index) {
                          return Card(
                              child: ListTile(
                            title: Text("${listofDocumentSnap[index]["name"]}"),
                            subtitle: Text("Fiyat: "+"${listofDocumentSnap[index]["fiyat"]}"),
                            leading: IconButton(icon: Icon(Icons.delete),onPressed: ()async{
                               await listofDocumentSnap[index].reference.delete();
                            },),
                            trailing: IconButton(
                              icon: Icon(Icons.message),
                              
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) => BottomBarPage(),
                                );
                              },
                            ),
                          ));
                        },
                      ),
                    
                    ),
                    FloatingActionButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()),);},child: Text("Geri"),)
                  ],
                );
                
              }),
              
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> VeriEkle()),);},child: Icon(Icons.add),),
      ),
    );
  }
}


