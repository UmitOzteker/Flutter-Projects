import 'package:bilgi_testi/soru.dart';

class TestVeri{
  int _soruIndex = 0;
  // ignore: prefer_final_fields
  List <Soru> _soruBankasi = [
  Soru(soruMetni:"Titanic gelmiş geçmiş en büyük gemidir",soruYaniti: false),
  Soru(soruMetni:"Dünyadaki tavuk sayısı insan sayısından fazladır",soruYaniti: true ),
  Soru(soruMetni:"Kelebeklerin ömrü bir gündür",soruYaniti: false ),
  Soru(soruMetni:"Dünya düzdür",soruYaniti: false ),
  Soru(soruMetni:"Kaju fıstığı aslında bir meyvenin sapıdır",soruYaniti: false ),
  Soru(soruMetni:"Fatih Sultan Mehmet hiç patates yememiştir",soruYaniti: true ),
  Soru(soruMetni:"Fransızlar 80 d Lemek için, 4 - 20 der",soruYaniti: true ),
  ];

  String? getSoruMetni(){
    return _soruBankasi[_soruIndex].soruMetni;
  }

  bool? getSoruYaniti(){
    return _soruBankasi[_soruIndex].soruYaniti;
  }

  void sonrakiSoru(){
    if(_soruIndex+1<_soruBankasi.length)
    {_soruIndex++;
    }
  }

  bool testBittiMi(){
    if(_soruIndex+1>=_soruBankasi.length){
      return true;
    }else{return false;}
  }

  void testiSifirla(){
    _soruIndex=0;
  }
}


