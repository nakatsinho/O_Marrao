import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:o_marrao/Windows/Single/Premios/diario.dart';
import 'package:o_marrao/Windows/Single/Premios/mensal.dart';
import 'package:o_marrao/Windows/Single/Premios/semanal.dart';

class Position extends StatefulWidget {
  @override
  State createState() => new _PositionState();
}

class _PositionState extends State<Position> with SingleTickerProviderStateMixin {
  int count = 0;

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 3, vsync: this, initialIndex: 1);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Posiçao",style: TextStyle(
                      fontSize: 24.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Mono Social Icons',
                    ),),
        centerTitle: true,
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.green,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.score),
              text: "DIÁRIA",
              ),
            new Tab(
              icon: new Icon(Icons.score),
              text: "SEMANAL",
              ),
            new Tab(
              icon: new Icon(Icons.score),
              text: "MENSAL",
              ),
          ],
          ),
        actions: <Widget>[
          new Icon(Icons.more_vert),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            )
        ],
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          new Dia(),
          new Semana(),
          new Mes(),
        ],
        ),
    );
  }
}
