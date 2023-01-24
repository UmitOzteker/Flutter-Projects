import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home:  Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 85, 0, 0),
        title:Text("Favori Filmim"),
      ),
      body: Center(
        child: Image.network("https://upload.wikimedia.org/wikipedia/en/8/83/Dark_knight_rises_poster.jpg")
      ),
    )
  ));
}

