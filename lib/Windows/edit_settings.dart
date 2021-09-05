import 'package:flutter/material.dart';

class EditProf extends StatefulWidget {
  @override
  State createState () =>
      new _EditProfState(
      );
}

class _EditProfState extends State<EditProf> {

  TextEditingController name = new TextEditingController();
  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController nasc = new TextEditingController();
  TextEditingController number = new TextEditingController();

  int count = 0;

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Editar",style: TextStyle(
          fontSize: 16.0,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          fontFamily: 'Mono Social Icons',
          ),
            ),
        centerTitle: true,
        ),
      body: Padding(
          padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
          child: ListView(
          children: <Widget>[
          TextFormField(
          keyboardType: TextInputType.text,
            autofocus: false,
            //initialValue: 'Username',
            style: TextStyle(color: Colors.amber),
            controller: name,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.white),
              icon: Icon(Icons.account_circle),
              hintText: 'Introduza seu nome completo',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0)
                  ),
              ),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            autofocus: false,
            //initialValue: 'Username',
            style: TextStyle(color: Colors.amber),
            controller: user,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: Colors.white),
              icon: Icon(Icons.perm_identity),
              hintText: 'Introduza o Username',
              contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0)
                  ),
              ),
            ),
        TextFormField(
          keyboardType: TextInputType.text,
          autofocus: false,
          //initialValue: 'vmall.co.mz',
          obscureText: true,
          controller: pass,
          decoration: InputDecoration(
            icon: Icon(Icons.https),
            hintText: 'Introduza a senha',
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0)
                ),
            ),
          ),

        TextFormField(
        keyboardType: TextInputType.text,
        autofocus: false,
        //initialValue: 'Username',
        style: TextStyle(color: Colors.amber),
        controller: nasc,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white),
          icon: Icon(Icons.calendar_today),
          hintText: 'Nacimento dd/mm/aaaa',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0)
              ),
          ),
          ),
      TextFormField(
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        //initialValue: ('Introduza o Email'),
        controller: email,
        decoration: InputDecoration(
          icon: Icon(Icons.email),
          hintText: 'example@marrao.co.mz',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0)
              ),
          ),
        ),
      TextFormField(
        keyboardType: TextInputType.phone,
        autofocus: false,
        //initialValue: "",
        controller: number,
        decoration: InputDecoration(
          icon: Icon(Icons.phone_android),
          hintText: '+(258) 8',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0)
              ),
          ),
        ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Material(
          borderRadius: BorderRadius.circular(35.0),

          elevation: 18.0,
          child: MaterialButton(
            minWidth: 10.0,
            height: 50.0,
            onPressed: (){
              //addData();
              Navigator.pop(context);
            },
            color: Colors.lime,
            child: Text('Actualizar', style: TextStyle(
              fontSize: 16.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w300,
              fontFamily: 'Mono Social Icons',
              ),),
            splashColor: Colors.red,
            highlightColor: Colors.orange,
            ),
          ),
        )
      ],
          ),),
      );
  }
}