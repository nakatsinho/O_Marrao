import 'package:flutter/material.dart';
//import 'package:o_marrao/Windows/Single/player1.dart';

class EPointsPage extends StatefulWidget {
  final int _score;
  final int _totalQuestion;
  final String _level;

  EPointsPage(this._score, this._totalQuestion, this._level);

  @override
  PointsPageState createState() {
    return new PointsPageState();
  }
}

class PointsPageState extends State<EPointsPage>
    with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation;

  AnimationController animationController;

  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

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

  void stars() {
    if (widget._score <= 10) {}
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
                        Icon(Icons.star_border, size: 50.0, color: Colors.blue),
                        Icon(Icons.star, size: 60.0, color: Colors.lightBlue),
                        Icon(Icons.star_border,
                            size: 90.0, color: Colors.blueAccent),
                        Icon(Icons.star,
                            size: 60.0, color: Colors.lightBlueAccent),
                        Icon(Icons.star_border,
                            size: 50.0, color: Colors.blueGrey),
                      ],
                    ),
                  ),
                  Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0.0, 0.0),
                      child: new Text(
                        "Parabens Marrao...",
                        style: TextStyle(
                            fontSize: 40.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Mono Social Icons',
                            color: Colors.white
                            ),
                      )),
                  new SizedBox(
                    height: 20.0,
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        muchDelayedAnimation.value * width, 0.0, 0.0),
                    child: new MaterialButton(
                        minWidth: 240.0,
                        height: 42.0,
                        onPressed: () =>
                            Navigator.of(context).pushNamed("/SingleHome"),
                        color: Colors.orange,
                        splashColor: Colors.tealAccent,
                        child: IconButton(
                            tooltip: "Clique para repetir",
                            icon: new Icon(
                              Icons.refresh,
                              color: Colors.white,
                            ),
                            iconSize: 50.0,
                            onPressed: () => Navigator.of(context)
                                .pushNamed("/SingleHome"))),
                  ),
                  Padding(padding: EdgeInsets.only(top:15.0)),
                  Text("Voçe Venceu !!!", style: TextStyle(
                      fontSize: 18.0,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Mono Social Icons',
                      color: Colors.indigo),)
                ],
              ),
            ),
          );
        });
  }
}
