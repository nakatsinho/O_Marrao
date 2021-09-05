import 'package:flutter/material.dart';

class Privacity extends StatefulWidget {
  @override

  State createState () =>
      new _PrivacityState(
      );
}

class _PrivacityState extends State <Privacity> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Politicas de Privacidade"),
        centerTitle: true,
        iconTheme: IconThemeData.fallback(),
        ),
      body: Container(
        child: Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Text("Sobre as Politicas"),
                       ],
                     ),
          ),
        ),
      );
  }
}