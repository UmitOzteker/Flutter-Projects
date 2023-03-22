import 'package:e_ticaret/login.dart';
import 'package:e_ticaret/sat%C4%B1c%C4%B1_giris.dart';
import 'package:e_ticaret/satici_login.dart';
import 'package:flutter/material.dart';

import 'musteri_giris.dart';
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
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> SaticiLoginPage()),);},
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
