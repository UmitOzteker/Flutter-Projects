import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../models/weather_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<Weather> fetchWeather() async {
    final resp = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=41.015137&lon=28.979530&appid=4c1d6be0e70269fb9ceaa98e8cb8d9b7'));

    if (resp.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(resp.body);
      return Weather.fromJson(json);
    } else {
      throw Exception("Veriler yüklenmedi");
    }
  }

  late Future<Weather> myWeather;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    myWeather = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 30),
        child: Stack(children: [
          SafeArea(
            top: true,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage("assets/person.jpg"),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              FutureBuilder<Weather>(
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          snapshot.data!.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          snapshot.data!.weather[0]["main"].toString(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              letterSpacing: 1.3,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "6 Aralık 2023",
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 250,
                          width: 250,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/cloudy.png"))),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Sıcaklık",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "${((snapshot.data!.main["temp"] - 32 * 5) / 9).toStringAsFixed(2)}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 21,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Rüzgar",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                                Text(
                                  "${snapshot.data!.wind["speed"]} km/h",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Column(
                              children: [
                                Text(
                                  "Nem",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "${snapshot.data!.main["humidity"]}%",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Haftalık Hava Durumu"),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurpleAccent,
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width / 1.1, 50)),
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text("Veriler yüklenemedi...");
                  } else {
                    return CircularProgressIndicator(
                      color: Colors.white,
                    );
                  }
                },
                future: myWeather,
              )
            ]),
          )
        ]),
      ),
    );
  }
}
