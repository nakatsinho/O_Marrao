import 'package:flutter/material.dart';
//import 'package:o_marrao/Windows/Single/player1.dart';

class PointsPage extends StatefulWidget {
  final int _score;
  final int _totalQuestion;
  final String _level;

  PointsPage(this._score, this._totalQuestion, this._level);

  @override
  PointsPageState createState() {
    return new PointsPageState();
  }
}

class PointsPageState extends State<PointsPage>
    with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation;

  AnimationController animationController;

  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 4), vsync: this);

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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        Icon(Icons.sentiment_dissatisfied,
                            size: 190.0, color: Colors.orange),
                        Text("Voçe Perdeu...", style: TextStyle(
                            fontSize: 28.0,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Mono Social Icons',
                            color: Colors.indigo),)

                      ],
                    ),
                  ),
                  Transform(
                      transform: Matrix4.translationValues(
                          delayedAnimation.value * width, 0.0, 0.0),
                      child: new Text(
                        widget._score.toString() +
                            "/" +
                            widget._totalQuestion.toString(),
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
                  Text(
                    //"Ganhou "+ _star.toString(),
                    widget._level.toString(),
                      style: TextStyle(
                          fontSize: 28.0,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Mono Social Icons',
                          color: Colors.greenAccent),
                    ),
                ],
              ),
            ),
          );
        });
  }
}
