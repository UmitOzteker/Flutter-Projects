import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main(){
  runApp(drumMachine());
}
class drumMachine extends StatelessWidget { 
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     home: Scaffold( 
      backgroundColor: Colors.black,
      body:DrumPage(), 
     ),
     );
  }
}

class DrumPage extends StatelessWidget {

  final player = AudioPlayer(); 
  Future<void> sesiCal(String ses) async {
   await player.setSource(AssetSource("$ses.wav"));
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                 Expanded(
                    child: TextButton(
                        onPressed: ()  { sesiCal("assets_bongo");
                        },
                    child: Container(
                      color: Colors.amberAccent,
                     ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                        onPressed: () {
                          sesiCal("assets_bip");
                        },
                    child: Container(
                      color: Colors.blueAccent,
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
                    child: TextButton(
                        onPressed: ()  async {sesiCal("assets_clap1");
                        },
                    child: Container(
                      color: Colors.redAccent,
                     ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                        onPressed: ()  async {sesiCal("assets_clap2");
                        },
                    child: Container(
                      color: Colors.greenAccent,
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
                    child: TextButton(
                        onPressed: ()  async {sesiCal("assets_clap3");
                        },
                    child: Container(
                      color: Colors.yellowAccent,
                     ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                        onPressed: ()  async {sesiCal("assets_crash");
                        },
                    child: Container(
                      color: Colors.blueGrey,
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
                    child: TextButton(
                        onPressed: ()  async {sesiCal("assets_how");
                        },
                    child: Container(
                      color: Colors.deepPurpleAccent,
                     ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                        onPressed: ()  async {sesiCal("assets_oobah");
                        },
                    child: Container(
                      color: Colors.orange,
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