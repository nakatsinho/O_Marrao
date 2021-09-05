import 'package:flutter/material.dart';
//import 'package:o_marrao/Windows/VS/player2.dart';


class ScoresPage extends StatelessWidget
{
  final int _score;
  final int _totalQuestion;
  final int _score1;
  final int _totalQuestion1;

  ScoresPage(this._score, this._totalQuestion, this._score1,this._totalQuestion1);

  @override
  Widget build(BuildContext context)
  {
    return new Material(

      //color: new Color(0x476879ff),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new MaterialButton(
              minWidth: 200.0,
              height: 62.0,
              onPressed: ()=> Navigator.of(context).pushNamed("/DoublePlay"),
              color: Colors.teal,
              splashColor: Colors.tealAccent,
              child: IconButton(
                  tooltip: "Clique para repetir",
                  icon: new Icon(
                    Icons.refresh,
                    color: Colors.white,
                    ),
                  iconSize: 50.0,
                  onPressed: ()=> Navigator.of(context).pushNamed("/DoublePlay"))
              ),
          new Text(_score.toString() +"/"+ _totalQuestion.toString(),style: TextStyle(color: Colors.green, fontSize: 35.0),),
          new Text("JOGADOR 1:", style: TextStyle(color: Colors.redAccent, fontSize: 40.0),),

          Divider(color: Colors.teal,),

          new Text("JOGADOR 2:", style: TextStyle(color: Colors.redAccent, fontSize: 40.0),),
          new Text(_score1.toString() +"/"+ _totalQuestion1.toString(),style: TextStyle(color: Colors.green, fontSize: 35.0),),
          new MaterialButton(
              minWidth: 200.0,
              height: 62.0,
              onPressed: ()=> Navigator.of(context).pushNamed("/DoublePlay"),
              color: Colors.teal,
              splashColor: Colors.tealAccent,
              child: IconButton(
                  tooltip: "Clique para repetir",
                  icon: new Icon(
                    Icons.refresh,
                    color: Colors.white,
                    ),
                  iconSize: 50.0,
                  onPressed: ()=> Navigator.of(context).pushNamed("/DoublePlay"))
              ),
        ],
        ),
      );
  }
}

