import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_expectancy/constants.dart';
import 'package:life_expectancy/result_page.dart';
import 'package:life_expectancy/user_data.dart';

import 'MyColumn.dart';
import 'MyContainer.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? seciliCinsiyet;
  double icilenSigara = 15.0;
  double yapilanSpor = 3.0;
  int BOY = 170;
  int KILO = 60;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: MyContainer(
                  child: newMethodOutlinedButton("BOY"),
                ),
              ),
              Expanded(
                child: MyContainer(
                  child: newMethodOutlinedButton("KİLO"),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: MyContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Haftada Kaç Gün Spor Yapıyorsunuz?", style: kMetinStili),
                Text("${yapilanSpor.round()}", style: kSayiStili),
                Slider(
                  min: 0,
                  max: 7,
                  value: yapilanSpor,
                  onChanged: (double value) {
                    setState(() {
                      yapilanSpor = value;
                    });
                  },
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: MyContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Günde Kaç Sigara İçiyorsunuz?", style: kMetinStili),
                Text("${icilenSigara.round()}", style: kSayiStili),
                Slider(
                  min: 0,
                  max: 30,
                  value: icilenSigara,
                  onChanged: (double value) {
                    setState(() {
                      icilenSigara = value;
                    });
                  },
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                child: MyContainer(
                  onPress: () {
                    setState(() {
                      seciliCinsiyet = "Kadın";
                    });
                  },
                  renk: seciliCinsiyet == "Kadın" ? Colors.red : Colors.white,
                  child: MyColumn(
                    mesaj: "Kadın",
                    ikon: FontAwesomeIcons.venus,
                  ),
                ),
              ),
              Expanded(
                child: MyContainer(
                  onPress: () {
                    setState(() {
                      seciliCinsiyet = "Erkek";
                    });
                  },
                  renk: seciliCinsiyet == "Erkek" ? Colors.red : Colors.white,
                  child: MyColumn(
                    ikon: FontAwesomeIcons.mars,
                    mesaj: "Erkek",
                  ),
                ),
              ),
            ],
          ),
        ),
        ButtonTheme(
          height: 50,
          child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => resultPage(userData(
                            KILO: KILO,
                            BOY: BOY,
                            icilenSigara: icilenSigara,
                            seciliCinsiyet: seciliCinsiyet,
                            yapilanSpor: yapilanSpor,
                          ))));
            },
            child: Text(
              "Hesapla",
              style: kMetinStili,
            ),
          ),
        ),
      ]),
    );
  }

  Row newMethodOutlinedButton(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
            quarterTurns: 3,
            child: Text(
              label,
              style: kMetinStili,
            )),
        SizedBox(
          width: 10,
        ),
        RotatedBox(
            quarterTurns: 3,
            child: Text(label == "BOY" ? BOY.toString() : KILO.toString(),
                style: kSayiStili)),
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonTheme(
              minWidth: 5.0,
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    label == "BOY" ? BOY++ : KILO++;
                  });
                },
                child: Icon(
                  FontAwesomeIcons.plus,
                  size: 10,
                  color: Colors.black,
                ),
                style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.lightBlue)),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            ButtonTheme(
              minWidth: 5.0,
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    label == "BOY" ? BOY-- : KILO--;
                  });
                },
                child: Icon(
                  FontAwesomeIcons.minus,
                  size: 10,
                  color: Colors.black,
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.lightBlue),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
