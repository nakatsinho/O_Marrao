import 'dart:async';
import 'dart:convert';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:connectivity/connectivity.dart';

class Login extends StatefulWidget {
  const Login({
    Key key,
    @required this.onSubmit,
  }) : super(key: key);

  final VoidCallback onSubmit;

  @override
  State createState() => new _LoginState();
}

String username = '';
String emailv = '';
String num = "";

class _LoginState extends State<Login> with SingleTickerProviderStateMixin {
  var _formKey = GlobalKey<FormState>();

  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));
    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)));
  }

  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  String report = "", report2 = "";
  bool checkBoxState = false;
  String txt = "Lembre-me";

  Future<List> _login() async {
    print("Login Improved");
    //Navigator.of(context).pushNamed("/HomePage");
    final response =
        await http.post("http://marrao.com/marrao/login.php", body: {
      "email": user.text,
      "password": pass.text,
    });

    var datauser = json.decode(response.body);

//    Timer(
//        Duration(seconds: 3),
//            () => this.setState(() {
//          Navigator.of(context).push(new MaterialPageRoute(
//              builder: (BuildContext context) =>
//              new PointsPage()));
//        }));

    if (datauser.length == 0) {
      setState(() {
        report = "Email or Password Incorrect";
        print("Login Improved");
      });
    } else {
      if (datauser[0]['type'] == 'admin') {
        setState(() {
          report2 = "Welcome Administrator";
          print("Login Proved");
          Navigator.of(context).pushNamed("/HomePage");
          username = datauser[0]['username'];
          emailv = datauser[0]['email'];
          num = datauser[0]['numero'];
        });
      } else if (datauser[0]['type'] == 'user') {
        setState(() {
          report2 = "Login Sucessful authenticated";
          Navigator.of(context).pushNamed("/HomePage");
          username = datauser[0]['username'];
          emailv = datauser[0]['email'];
          num = datauser[0]['numero'];
        });
      }
    }
    return datauser;
  }

  void _alertNivel0() {
    AlertDialog alertsnivel0 = new AlertDialog(
      title: new Text(
        "Atençao!!!",
        style: TextStyle(color: Colors.red),
        textAlign: TextAlign.center,
        ),
      content: new Text(
        "Verifique a sua conexao de Internet!",
        style: TextStyle(color: Colors.orange),
        textAlign: TextAlign.center,
        ),
      actions: <Widget>[
        new RaisedButton(
            color: Colors.orange,
            child: new Text("OK",
                                overflow: TextOverflow.fade,
                                style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.pop(context);
            })
      ],
      );

    showDialog(
      context: context,
      child: Row(
        children: <Widget>[
          alertsnivel0,
        ],
        ),
      );
  }
  @override
  Widget build(BuildContext context) {
    final onoffmode = OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        //Color red = Color(0xFF00EE44);
        //Color green = Color(0xFFEE4400);
        String text1 = "Online";
        String text2 = "Offline";

        final bool connectedM = connectivity != ConnectivityResult.mobile;
        final bool connectedW = connectivity != ConnectivityResult.wifi;
        return new Column(
          children: <Widget>[
            //color: connected ? green : red,
            Text("Mobile data: ${connectedM ? text2 : text1}",
                style: TextStyle(color: Colors.white12)),
            Text("Wi-fi data: ${connectedW ? text2 : text1}",
                style: TextStyle(color: Colors.white12)),
          ],
        );
      },
      child: Center(),
    );
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          final body = Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/marrao/red.png'), fit: BoxFit.fill),
            ),
            child: Column(
              children: <Widget>[
                onoffmode,
                Transform(
                  transform: Matrix4.translationValues(
                      animation.value * width, 0.0, 0.0),
                  child: Hero(
                    tag: 'hero',
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 120.0,
                      child: Image.asset('assets/marrao/logo.png'),
                    ),
                  ),
                ),
                SizedBox(height: 4.0),
                Transform(
                  transform: Matrix4.translationValues(
                      delayedAnimation.value * width, 0.0, 0.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    autofocus: false,
                    controller: user,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Preencha o campo de E-mail!";
                      }
                    },
                    //initialValue: 'example@marrao.co.mz',
                    decoration: InputDecoration(
                      hintText: 'Introduza o E-mail',
                      errorStyle: TextStyle(
                        color: Colors.lightGreenAccent,
                        fontSize: 12.0,
                      ),
                      icon: Icon(Icons.perm_identity),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Transform(
                  transform: Matrix4.translationValues(
                      delayedAnimation.value * width, 0.0, 0.0),
                  child: TextFormField(
                    autofocus: false,
                    controller: pass,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Preencha o campo da Senha!";
                      }
                    },
                    //initialValue: 'you password',
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Introduza a Palavra-Passe',
                      errorStyle: TextStyle(
                        color: Colors.lightGreenAccent,
                        fontSize: 12.0,
                      ),
                      icon: Icon(Icons.https),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  report2,
                  style: TextStyle(fontSize: 14.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                Text(
                  report,
                  style: TextStyle(fontSize: 14.0, color: Colors.limeAccent),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0.0, 0.0),
                      child: FlatButton(
                        splashColor: Colors.red,
                        padding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 0.0),
                        child: Container(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: <Widget>[
                                new Row(
                                  children: <Widget>[
                                    Checkbox(
                                        value: checkBoxState,
                                        onChanged: (bool e) => rememberState()),
                                    Text(
                                      txt,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Mono Social Icons',
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                        onPressed: () {
                          //Navigator.of(context).pushNamed("/Forgot");
                        },
                      ),
                    ),
                    Transform(
                      transform: Matrix4.translationValues(
                          muchDelayedAnimation.value * width, 0.0, 0.0),
                      child: FlatButton(
                        splashColor: Colors.red,
                        padding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 0.0),
                        child: Container(
                            alignment: Alignment.centerRight,
                            child: Row(
                              children: <Widget>[
                                new Text(
                                  'Esqueceu-se da senha?',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Mono Social Icons',
                                      color: Colors.black),
                                ),
                              ],
                            )),
                        onPressed: () {
                          Navigator.of(context).pushNamed("/Forgot");
                        },
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Transform(
                    transform: Matrix4.translationValues(
                        muchDelayedAnimation.value * width, 0.0, 0.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(12.0),
                      //shadowColor: Colors.lightBlueAccent.shade700,
                      elevation: 6.0,
                      child: MaterialButton(
                        minWidth: 370.0,
                        height: 48.0,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _login();
                          }
                        },
                        //splashColor: Colors.purple,
                        color: Colors.orange,
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                              fontSize: 18.0,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Mono Social Icons',
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                FlatButton(
                  child: Text(
                    'Registe sua conta!',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Mono Social Icons',
                        color: Colors.amber),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.end,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed("/SignUp");
                  },
                ),
              ],
            ),
          );

          return Scaffold(
            resizeToAvoidBottomPadding: false,
            body: Form(key: _formKey, child: body),
            bottomNavigationBar: Container(
              color: Colors.orange,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Esta é apenas uma versão demo!",
                    style: TextStyle(
                        fontSize: 14.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Raleway',
                        color: Colors.black),
                  )
                ],
              ),
            ),
          );
        });
  }

  void rememberState() {
    setState(() {
      if (checkBoxState) {
        txt = "Lembre-me";
        checkBoxState = !checkBoxState;
      } else {
        txt = "Lembrado";
        checkBoxState = !checkBoxState;
      }
    });
  }
}
