import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Random _random = Random();

  Color _color = Color(0xFFFFFFFF);
  Color _colorText;

  void changeColor() {
    Color color = Color.fromARGB(
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );

    Color textColor;

    if (color.red > 150 || color.green > 150 || color.blue > 150) {
      textColor = Colors.white;
    } else {

      textColor = Colors.black;
    }

    setState(() {
      _color = color;
      _colorText = textColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            changeColor()
          });
        },
        child: Scaffold(
          backgroundColor: _color,
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Container(
            alignment: Alignment.center,
            child: new Text(
              "Hey there",
              style: new TextStyle(color: _colorText),
              textAlign: TextAlign.center,
            ),
          ),
        ));
  }
}
