import 'package:life_expectancy/user_data.dart';

class Hesap{
  userData _userData;
  Hesap(this._userData);
  double? hesaplama(){
    double? sonuc;
    sonuc=90 + _userData.yapilanSpor! - _userData.icilenSigara!;
    sonuc= sonuc + (_userData.BOY!/_userData.KILO!);
   return sonuc+3;
  }
}