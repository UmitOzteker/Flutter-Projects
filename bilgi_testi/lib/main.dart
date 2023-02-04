import 'package:flutter/material.dart';

import 'constants.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  
  List <Soru> soruBankasi = [
  Soru(soruMetni:"Titanic gelmiş geçmiş en büyük gemidir",soruYaniti: false),
  Soru(soruMetni:"Dünyadaki tavuk sayısı insan sayısından fazladır",soruYaniti: true ),
  Soru(soruMetni:"Kelebeklerin ömrü bir gündür",soruYaniti: false ),
  Soru(soruMetni:"Dünya düzdür",soruYaniti: false ),
  Soru(soruMetni:"Kaju fıstığı aslında bir meyvenin sapıdır",soruYaniti: false ),
  Soru(soruMetni:"Fatih Sultan Mehmet hiç patates yememiştir",soruYaniti: true ),
  Soru(soruMetni:"Fransızlar 80 demek için, 4 - 20 der",soruYaniti: true ),
];

 int soruIndex=0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
              soruBankasi[soruIndex].soruMetni.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 3,
          spacing: 3,
          direction: Axis.horizontal,
          children: secimler,
          ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: EdgeInsets.all(12),
                          ),
                          child: Icon(
                            Icons.thumb_down,
                            size: 30.0,
                          ),
                          onPressed: () {
                            setState(() {
                              soruBankasi[soruIndex].soruYaniti==true
                              ?secimler.add(kDogruIconu)
                              :secimler.add(kYanlisIconu);
                              soruIndex++;
                              //secimler.add(kYanlisIconu);
                            });
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: EdgeInsets.all(12),
                          ),
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            setState(() {
                              soruBankasi[soruIndex].soruYaniti==false
                              ?secimler.add(kDogruIconu)
                              :secimler.add(kYanlisIconu);
                              soruIndex++;                              
                            });
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}
   


class Soru{
  String? soruMetni;
  bool? soruYaniti;
 
  Soru({@required this.soruMetni,this.soruYaniti});
}