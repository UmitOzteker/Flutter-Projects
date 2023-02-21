import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider_1/counter_provider.dart';

class CounterPage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
     final counter=Provider.of<CounterProvider>(context);
    final count = counter.count;
    return Scaffold(
      appBar: AppBar(
        title:  Text("Counter with Provider"),
      ),
      body: Center(child: Text("${Provider.of<CounterProvider>(context).count}")),
      floatingActionButton:  FloatingActionButton(onPressed: counter.increment,
      child: Icon(Icons.plus_one),),
    );
  }
}