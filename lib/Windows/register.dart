import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:o_marrao/Windows/privacity.dart';
import 'package:o_marrao/Windows/terms.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => new _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var _formKey = GlobalKey<FormState>();

  void _alertRegister() {
    AlertDialog alertsnivel0 = new AlertDialog(
      title: new Text(
        "Cadastro!",
        style: TextStyle(color: Colors.red),
        textAlign: TextAlign.center,
      ),
      content: new Text(
        "Cadastou-se com sucesso no Jogo!",
        style: TextStyle(color: Colors.orange),
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
//        new RaisedButton(
//            color: Colors.orange,
//            child: new Text("OK",
//                                overflow: TextOverflow.fade,
//                                style: TextStyle(color: Colors.white)),
//            onPressed: () {
//              //Navigator.pop(context);
//            })
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

  void _alertCheckBox() {
    AlertDialog alertsnivel0 = new AlertDialog(
      title: new Text(
        "Atençao!",
        style: TextStyle(color: Colors.red),
        textAlign: TextAlign.center,
        ),
      content: new Text(
        "Aceite nossos Termos & Condiçoes,\n e Politicas de Privacidade para \n poder se cadastrar no Jogo!",
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

  TextEditingController name = new TextEditingController();
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController nasc = new TextEditingController();
  TextEditingController number = new TextEditingController();

  bool checkBoxP = false;
  bool checkBoxT = false;

  void addData() {
    var url = "http://marrao.com/marrao/adddata.php";

    http.post(url, body: {
      "name": name.text,
      "username": user.text,
      "password": pass.text,
      "email": email.text,
      "nascimento": nasc.text,
      "numero": number.text
    });
  }

  void checkBoxStateT() {
    setState(() {
      if (checkBoxT) {
        checkBoxT = !checkBoxT;
      } else {
        checkBoxT = !checkBoxT;
      }
      return checkBoxT;
    });
  }

  void checkBoxStateP() {
    setState(() {
      if (checkBoxP) {
        checkBoxP = !checkBoxP;
      } else {
        checkBoxP = !checkBoxP;
      }
      return checkBoxP;
    });
  }

  @override
  Widget build(BuildContext context) {
    

    final welcome = Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        'Sign Up "O Marrão" Account',
        style: TextStyle(
            fontSize: 24.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w300,
            fontFamily: 'Raleway',
            color: Colors.amber),
      ),
    );

    final welMessage = Padding(
      padding: EdgeInsets.all(7.0),
      child: Text(
        'Preencha correctamente os campos em branco para se cadastrar no "O Marrão"! Iremos enviar um e-mail de confirmação para sua conta! ',
        style: TextStyle(
            fontSize: 17.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w300,
            fontFamily: 'Raleway',
            color: Colors.white),
      ),
    );

    final names = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      //initialValue: 'Username',
      style: TextStyle(color: Colors.amber),
      controller: name,
      validator: (String value) {
        if (value.isEmpty) {
          return "Preencha o campo do Nome!";
        }
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.lightGreenAccent),
        labelStyle: TextStyle(color: Colors.white),
        icon: Icon(Icons.account_circle),
        hintText: 'Introduza seu nome completo',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
      ),
    );

    final users = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      //initialValue: 'Username',
      style: TextStyle(color: Colors.amber),
      controller: user,
      validator: (String value) {
        if (value.isEmpty) {
          return "Preencha o campo de Username!";
        }
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.lightGreenAccent),
        labelStyle: TextStyle(color: Colors.white),
        icon: Icon(Icons.perm_identity),
        hintText: 'Introduza o Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
      ),
    );

    final passs = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      //initialValue: '.co.mz',
      obscureText: true,
      controller: pass,
      validator: (String value) {
        if (value.isEmpty) {
          return "Preencha o campo de Senha!";
        }
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.lightGreenAccent),
        icon: Icon(Icons.https),
        hintText: 'Introduza a senha',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
      ),
    );

    final born = TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      //initialValue: 'Username',
      style: TextStyle(color: Colors.amber),
      controller: nasc,
      validator: (String value) {
        if (value.isEmpty) {
          return "Preencha o campo da data de Nascimento!";
        }
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.lightGreenAccent),
        labelStyle: TextStyle(color: Colors.white),
        icon: Icon(Icons.calendar_today),
        hintText: 'Nacimento aaaa-mm-dd',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
      ),
    );

    final emaill = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      //initialValue: ('Introduza o Email'),
      validator: (String value) {
        if (value.isEmpty) {
          return "Preencha o campo de E-mail!";
        }
      },
      controller: email,
      decoration: InputDecoration(
        icon: Icon(Icons.email),
        errorStyle: TextStyle(color: Colors.lightGreenAccent),
        hintText: 'example@marrao.co.mz',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
      ),
    );

    final contact = TextFormField(
      keyboardType: TextInputType.phone,
      autofocus: false,
      //initialValue: "",
      controller: number,
      validator: (String value) {
        if (value.isEmpty) {
          return "Preencha o campo do numero!";
        }
      },
      decoration: InputDecoration(
        errorStyle: TextStyle(color: Colors.lightGreenAccent),
        icon: Icon(Icons.phone_android),
        hintText: '+(258) ',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 1.0),
      child: Material(
        borderRadius: BorderRadius.circular(35.0),
        elevation: 18.0,
        child: MaterialButton(
          minWidth: 60.0,
          height: 50.0,
          onPressed: () {
            if (checkBoxT == true) {
              addData();
              _alertRegister();
            }
            else
              {
                _alertCheckBox();
              }
          },
          color: Colors.white,
          child: Text('Cadastrar', style: TextStyle(color: Colors.purple)),
          splashColor: Colors.red,
          highlightColor: Colors.orange,
        ),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/marrao/red.png'), fit: BoxFit.fill),
      ),
      child: Column(
        children: <Widget>[
          welcome,
          welMessage,
          names,
          SizedBox(height: 3.0),
          users,
          SizedBox(height: 3.0),
          passs,
          SizedBox(height: 3.0),
          born,
          SizedBox(height: 3.0),
          emaill,
          SizedBox(height: 3.0),
          contact,
          SizedBox(height: 10.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              FlatButton(
                  onPressed: (){
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) =>
                        new Terms()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Checkbox(
                          value: checkBoxT,
                          onChanged: (bool e) => checkBoxStateT()),
                      Text(
                        "Termos e Politicas de Privacidade",
                        style: TextStyle(fontSize: 17.0,
                                             fontStyle: FontStyle.italic,
                                             fontWeight: FontWeight.w300,
                                             fontFamily: 'Raleway',
                                             color: Colors.white,),
                      ),
                    ],
                  )),
//              FlatButton(
//                onPressed: (){
//                  Navigator.of(context).push(new MaterialPageRoute(
//                      builder: (BuildContext context) =>
//                      new Privacity()));
//                },
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    Checkbox(
//                        value: checkBoxP,
//                        onChanged: (bool e) => checkBoxStateP()),
//                    Text(
//                      "Politicas de Privacidade",
//                      style: TextStyle(fontSize: 17.0,
//                                           fontStyle: FontStyle.italic,
//                                           fontWeight: FontWeight.w300,
//                                           fontFamily: 'Raleway',
//                                           color: Colors.white),
//                    ),
//                  ],
//                ),
//              )
            ],
          )
        ],
      ),
    );

    return new Container(
      child: new Scaffold(
        resizeToAvoidBottomPadding: false,
        floatingActionButton: loginButton,
        body: Form(key: _formKey, child: body),
      ),
    );
  }
}
