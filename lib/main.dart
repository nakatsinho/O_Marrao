import 'dart:async';

import 'package:flutter/material.dart';
import 'package:o_marrao/Windows/Single/player1.dart';
import 'package:o_marrao/Windows/Single/position.dart';
import 'package:o_marrao/Windows/VS/player2.dart';
import 'package:o_marrao/Windows/register.dart';
import 'package:o_marrao/login.dart';
import 'package:o_marrao/principal.dart';
import 'package:o_marrao/splash.dart';
import 'package:o_marrao/switch.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'O Marrao',
      theme: ThemeData(
        primaryColor: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        "/HomePage": (BuildContext context) => new HomePage(),
        "/Login": (BuildContext context) => new Login(
          onSubmit: null,
        ),
        "/Log": (BuildContext context) => new Log(),
        "/SignUp": (BuildContext context) => new SignUp(),
        "/SingleHome": (BuildContext context) => new SingleHome(),
        "/Position": (BuildContext context) => new Position(),
        "/DoublePlay": (BuildContext context) => new DoublePlay(),
      },
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 10), () => Navigator.of(context).pushNamed("/Login"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage('assets/marrao/red.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 150.0,
              child: Image.asset('assets/marrao/logo.png'),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 90.0),
                    ),
                    Container(
                      width: 300.0,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 50.0,
                        child: Splash(),
                        //Image.asset('assets/marrao/loading.png'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
