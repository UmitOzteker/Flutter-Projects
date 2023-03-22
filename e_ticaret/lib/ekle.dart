import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class VeriEkle extends StatefulWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final _firestore = FirebaseFirestore.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  State<VeriEkle> createState() => _VeriEkleState();
}

class _VeriEkleState extends State<VeriEkle> {
  final _firestore = FirebaseFirestore.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController fiyatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference urunlerRef = _firestore.collection("urunler");
    var bilgisayarRef = urunlerRef.doc("hpvictus");
    return Scaffold(
      appBar: AppBar(title: Text("e-ticaret")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Form(
            child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(hintText: "İsim Giriniz"),
            ),
            TextFormField(
              controller: fiyatController,
              decoration: InputDecoration(hintText: "Lütfen Fiyat Giriniz"),
            )
          ],
        )),
        
        
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()async{
           Map<String, dynamic> urunData = {
              "name": nameController.text,
              "fiyat": fiyatController.text
            };
             await urunlerRef.doc(nameController.text).set(urunData);
      },
      child: Text("Ekle"),),
    );
  }
}
