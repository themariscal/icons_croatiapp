import 'package:flutter/material.dart';
import 'package:icons_font/icons_font.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      );
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: ListView.builder(
            padding: EdgeInsets.only(left: 50),
            itemCount: iconsMap.length,
            itemBuilder: (BuildContext context, int index) => ListTile(
              leading: Icon(
                iconsMap.values.elementAt(index),
                size: 50,
                color: Colors.blue,
              ),
              title: Text(iconsMap.keys.elementAt(index)),
            ),
          ),
        ),
      );
}
