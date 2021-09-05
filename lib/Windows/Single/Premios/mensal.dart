import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Mes extends StatefulWidget {
  @override
  _MesState createState() => new _MesState();
}

class _MesState extends State<Mes> {
  Future<List> getData() async {
    final response = await http.get("http://marrao.com/marrao/getdata.php");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      backgroundColor: Colors.white70,
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(list: snapshot.data)
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;

  ItemList({this.list});

  @override
  Widget build(BuildContext context) {
    
    return new ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (context, i) {
          return new Container(
            child: new Card(
              color: Colors.transparent,
              child: new ListTile(
                title: new Text(
                  "${list[i]['name']} | Pontos: ",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Mono Social Icons',
                    ),
                  ),
                leading: new Icon(
                  Icons.school,
                  size: 35.0,
                  color: Colors.deepPurple,
                  ),
                subtitle: new Text("Desde: ${list[i]['logs']}"),
                trailing: CircleAvatar(
                  child: Icon(Icons.info),
                  ),
                ),
              ),
            );
        });
  }
}
