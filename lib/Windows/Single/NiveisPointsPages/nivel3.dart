import 'package:flutter/material.dart';
import 'package:o_marrao/Windows/Single/StagePages/nivel3.dart';
import 'package:o_marrao/Windows/Single/StagePages/nivel2.dart';
import 'package:o_marrao/Windows/Single/player1.dart';
import 'package:o_marrao/principal.dart';

class NivelP3 extends StatefulWidget {
  final int _score;
  final int _totalQuestion;
  final String _level;

  NivelP3(this._score, this._totalQuestion, this._level);

  @override
  PointsPageState createState() {
    return new PointsPageState();
  }
}

class PointsPageState extends State<NivelP3>
    with SingleTickerProviderStateMixin {

  Animation animation, delayedAnimation, muchDelayedAnimation;

  AnimationController animationController;

  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(curve: Curves.elasticOut, parent: animationController));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
        parent: animationController));
    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn),
      parent: animationController,
      ));
  }

  int _star =0;

  void stars() {
    if (widget._score.toString() == "20") {
      _star = 5;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Material(
            child: new Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/marrao/red.png'),
                    fit: BoxFit.fill),
                ),
              //color: Color.fromRGBO(178, 26, 4, -0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Transform(
                    transform: Matrix4.translationValues(
                        animation.value * width, 0.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.star, size: 50.0, color: Colors.orange),
                        Icon(Icons.star, size: 60.0, color: Colors.orange),
                        Icon(Icons.star,
                                 size: 90.0, color: Colors.orange),
                        Icon(Icons.star,
                                 size: 60.0, color: Colors.orange),
                        Icon(Icons.star,
                                 size: 50.0, color: Colors.orange),
                      ],
                      ),
                    ),
                  Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0.0, 0.0),
                      child: new Text(
                        widget._score.toString() +
                            " / " +
                            widget._totalQuestion.toString(),
                        //widget._totalQuestion.toString(),
                        style: TextStyle(
                            fontSize: 40.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Mono Social Icons',
                            color: Colors.white),
                        )),
                  new SizedBox(
                    height: 20.0,
                    ),
                  Padding(padding: EdgeInsets.only(top: 40.0)),
                  Transform(
                    transform: Matrix4.translationValues(
                        muchDelayedAnimation.value * width, 0.0, 0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        IconButton(
                            tooltip: "Clique para continuar",
                            icon: new Icon(
                              Icons.refresh,
                              color: Colors.white,
                              ),
                            iconSize: 50.0,
                            onPressed: () {
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                  new Nivel2()));
                            }),
                        new IconButton(
                            tooltip: "Clique para continuar",
                            icon: new Icon(
                              Icons.menu,
                              color: Colors.white,
                              ),
                            iconSize: 50.0,
                            onPressed: () {
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                  new HomePage()));
                            }),
                        new IconButton(
                            tooltip: "Clique para continuar",
                            icon: new Icon(
                              Icons.fast_forward,
                              color: Colors.white,
                              ),
                            iconSize: 50.0,
                            onPressed: () {
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                  new Nivel3()));
                            })
                      ],
                      ),
                    ),
                  Padding(padding: EdgeInsets.only(top: 15.0)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        //"Ganhou "+ _star.toString(),
                        widget._level.toString(),
                          style: TextStyle(
                              fontSize: 25.0,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Mono Social Icons',
                              color: Colors.greenAccent),
                        ),
                      new Icon(Icons.star)
                    ],
                    ),
                  Text(
                    "Proximo nivel: Aspirante",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Mono Social Icons',
                        color: Colors.indigo),
                    )
                ],
                ),
              ),
            );
        });
  }
}
