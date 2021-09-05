import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:o_marrao/Windows/Single/StagePages/nivel2.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    void _alertScore() {
      AlertDialog alertscore = new AlertDialog(
        title: new Text(
          "Recordes",
          style: TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
          ),
        content: new Text("Mostra o teu potencial, neste jogo\n"
                              "de conteudo historico-cultural\n"
                              "moçambicano e responda correcta-\n"
                              "mente a todas perguntas para \n"
                              "te tornares O Marrão.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 14.0,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'Raleway',
                                color: Colors.black),),
        actions: <Widget>[
          new RaisedButton(
              color: Colors.orange,
              child: new Text("Sair",
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
            alertscore,
          ],
          ),
        );
    }

    void _alertSettings() {
      AlertDialog alertsettings = new AlertDialog(
        title: new Text(
          "Definições",
          style: TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
          ),
        content: Row(
          children: <Widget>[new Text("Minhas definições")],
          ),
        actions: <Widget>[
          new RaisedButton(
              color: Colors.orange,
              child: new Text(
                "Sair",
                overflow: TextOverflow.fade,
                style: TextStyle(color: Colors.white),
                ),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
        );

      showDialog(
        context: context,
        child: Row(
          children: <Widget>[
            alertsettings,
          ],
          ),
        );
    }

    void _alertInfo() {
      AlertDialog alertinfo = new AlertDialog(
        title: new Text(
          "Acerca do Marrão",
          style: TextStyle(color: Colors.red),
          textAlign: TextAlign.center,
          ),
        content: new Text(
          "O Marrão é um jogo didático \nmoçambicano criado com objectivo"
              "\nde tornar mais agradável e fascinante"
              "\na aprendizagem da cultura e/ou da "
              "\nhistória de Moçambique."
              "\nEste é um jogo de perguntas e "
              "\nrespostas (Quiz) onde o jogador"
              "\ntem para cada pergunta 4 opções e"
              "\ncom apenas uma opção correcta. E "
              "\npara mais detalhes visite as nossas "
              "\npáginas: \n\n - Facebook.com/omarraojogo\n - Instagram.com/omarraojogo",
          textAlign: TextAlign.justify,
          style: TextStyle(
              fontSize: 14.0,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w300,
              fontFamily: 'Raleway',
              color: Colors.black),
          ),
        actions: <Widget>[
          new RaisedButton(
              color: Colors.orange,
              child: new Text("Sair",
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
            alertinfo,
          ],
          ),
        );
    }

    final chat = Container(
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 150.0,
            child: Image.asset('assets/marrao/logo.png'),
            ),
          ),
        ),
      );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Material(
        borderRadius: BorderRadius.circular(15.0),
        //shadowColor: Colors.tealAccent,

        elevation: 65.0,
        child: MaterialButton(
          minWidth: 350.0,
          height: 62.0,
          onPressed: () {
            Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) =>
                new Nivel2()));
          },
          color: Colors.orange,
          splashColor: Colors.tealAccent,
          child: Text('JOGAR',
                        style: TextStyle(
                            fontSize: 40.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Mono Social Icons',
                            color: Colors.black
                            ),),
          ),
        ),
      );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(38.0),
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/marrao/red.png'), fit: BoxFit.fill),
        ),
      child: Column(
        children: <Widget>[chat, SizedBox(height: 80.0), loginButton],
        ),
      );

    return Scaffold(
//      appBar: new AppBar(
//        iconTheme: IconThemeData(color: Colors.black),
//        centerTitle: true,
//        backgroundColor: Color.fromRGBO(178, 26, 4, -0.1),
//        title: Row(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          children: <Widget>[
//            Row(
//              children: <Widget>[
//                new Text(
//                  "Stage: " ,
//                  style: TextStyle(
//                      fontSize: 20.0,
//                      fontStyle: FontStyle.normal,
//                      fontWeight: FontWeight.w300,
//                      fontFamily: 'Mono Social Icons',
//                      color: Colors.black
//                      ),
//                  ),
//              ],
//              ),
//            new CircleAvatar(
//              radius: 40.0,
//              backgroundColor: Colors.lightGreenAccent,
//
//              ),
//          ],
//          ),
//        elevation:
//        defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
//        bottom: PreferredSize(
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
//              children: <Widget>[
//                new Text(
//                  "Nível: " ,
//                  style: TextStyle(
//                      fontSize: 20.0,
//                      fontStyle: FontStyle.normal,
//                      fontWeight: FontWeight.w300,
//                      fontFamily: 'Mono Social Icons',
//                      color: Colors.black
//                      ),
//                  ),
//                Row(
//                    mainAxisAlignment: MainAxisAlignment.end,
//                    children: <Widget>[
////                      Text(
////                        + _life.toString(),
////                        style: TextStyle(
////                            fontSize: 20.0,
////                            fontStyle: FontStyle.normal,
////                            fontWeight: FontWeight.w300,
////                            fontFamily: 'Mono Social Icons',
////                            color: Colors.orange
////                            ),
////                        ),
//                    ]),
//              ],
//              ),
//            preferredSize: Size(1.0, 22.0)),
//        actions: <Widget>[
//          //new Icon(Icons.more_vert),
//          new Padding(
//            padding: const EdgeInsets.symmetric(horizontal: 5.0),
//            )
//        ],
//        ),
body: body,
  bottomNavigationBar: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      //IconButton(icon: Icon(Icons.person, color: Colors.orange,size: 30.0,), onPressed: _alertUser),
      IconButton(
          icon: Icon(
            Icons.score,
            color: Colors.orange,
            size: 30.0,
            ),
          onPressed: _alertScore),
      IconButton(
          icon: Icon(
            Icons.settings,
            color: Colors.orange,
            size: 30.0,
            ),
          onPressed: _alertSettings),
      IconButton(
          icon: Icon(
            Icons.info,
            color: Colors.orange,
            size: 30.0,
            ),
          onPressed: _alertInfo)
    ],
    ),
);
  }
}
