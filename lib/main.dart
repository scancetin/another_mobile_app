// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tapCounter = 10;
  bool _endGameCheck = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            GestureDetector(
              child: Container(
                height: height * (_tapCounter / 20),
                width: width,
                color: Colors.red,
                child: _endGameCheck ? null : Transform(alignment: Alignment.center, transform: Matrix4.rotationZ(math.pi), child: Image.asset("tap.png")),
              ),
              onTap: () {
                setState(() {
                  _tapCounter < 20 ? _tapCounter++ : _endGameCheck = true;
                });
              },
            ),
            GestureDetector(
              child: Container(
                height: height - height * (_tapCounter / 20),
                width: width,
                color: Colors.blue,
                child: _endGameCheck ? null : Image.asset("tap.png"),
              ),
              onTap: () {
                setState(() {
                  _tapCounter > 0 ? _tapCounter-- : _endGameCheck = true;
                });
              },
            ),
          ],
        ),
        _endGameCheck
            ? SizedBox(
                height: height * 0.6,
                width: height * 0.6,
                child: IconButton(
                  padding: EdgeInsets.all(0),
                  icon: Icon(Icons.play_arrow_rounded, size: height * 0.6),
                  color: Colors.black,
                  onPressed: () {
                    setState(() {
                      _endGameCheck = false;
                      _tapCounter = 10;
                    });
                  },
                ),
              )
            : Container(),
      ],
    ));
  }
}
