
import 'package:flutter/material.dart';
import 'package:flutter_application_15/veri_ekleme.dart';
import 'package:flutter_application_15/veri_guncelle.dart';
import 'package:flutter_application_15/veri_silme.dart';

import 'dokuman_dinleme.dart';
import 'koleksiyon_dinleme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Firebase Demo',
        home: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('Firebase Demo'),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Flexible(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amberAccent,
                              minimumSize: Size(150, 250),
                            ),
                            onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context)=> KoleksiyonDinleme()),);
                            },
                            child: Text(
                              "Koleksiyon Dinleme",
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            minimumSize: Size(150, 250),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> DokumanDinleme()));
                          },
                          child: Text(
                            "Döküman Dinleme",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                minimumSize: Size(150, 250)),
                            onPressed: () {  Navigator.push(context, MaterialPageRoute(builder: (context)=> VeriEkle()));},
                            child: Text("Veri Ekleme")),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal,
                                minimumSize: Size(150, 250)),
                            onPressed: () {
                               Navigator.push(context, MaterialPageRoute(builder: (context)=> VeriSilme()));
                            },
                            child: Text("Veri Silme")),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.red,minimumSize: Size(150, 250)),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> VeriGuncelle()));
                          },
                          child: Text("Veri Güncelleme")
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
