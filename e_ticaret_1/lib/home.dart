
import 'package:e_ticaret_1/musteri_girisi.dart';
import 'package:flutter/material.dart';

import 'login.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: double.maxFinite,
                          child: ElevatedButton(
                            onPressed: ()  {
                             Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage(ShowRegisterPage: () {  },)),);
                            },
                            child: Text("Müşteri Girişi",style: TextStyle(color: Colors.black),),
                            style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: double.maxFinite,
                    child: TextButton(
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage(ShowRegisterPage: () {  },)),);},
                      child: Container(
                        child: Text(
                          "Satıcı Girişi",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.amberAccent),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: double.maxFinite,
                    child: TextButton(
                      onPressed: () async {Navigator.push(context, MaterialPageRoute(builder: (context)=> GirisPage()),);},
                      child: Container(
                        child: Text(
                          "Misafir Girişi",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.redAccent),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}