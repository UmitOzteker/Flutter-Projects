import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:life_expectancy/constants.dart';
import 'package:life_expectancy/user_data.dart';
import 'hesap.dart';
class resultPage extends StatelessWidget {
  final  userData _userData;
  resultPage(this._userData);

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sonuç Sayfası")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 8,
              child: Center(
                  child: Text(
                Hesap(_userData).hesaplama()!.round().toString(),
                style: kMetinStili,
              ))),
          Expanded(
              flex: 1,
              child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Geri Dön",
                  style: kMetinStili,
                ),
              ))
        ],
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<userData>('_userData', _userData));
  }
}
