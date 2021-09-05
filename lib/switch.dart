import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Log extends StatefulWidget {
  @override
  State createState() => new _LoginState();
}

class _LoginState extends State<Log> with SingleTickerProviderStateMixin {
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

  void _alertVS() {
    AlertDialog alertuser = new AlertDialog(
      title: new Text(
        "MODO VS",
        style: TextStyle(color: Colors.red),
        textAlign: TextAlign.center,
      ),
      content: new Row(
        children: <Widget>[
          Divider(
            height: 2.0,
          ),
          new Text(
              "Brevemente lançaremos a versão \ncompleta do jogo!\n\nSiga-nos:  \n - Facebook.com/omarraojogo\n - Instagram.com/omarraojogo")
        ],
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
          alertuser,
        ],
      ),
    );
  }

  void _alertTimer() {
    AlertDialog alertuser = new AlertDialog(
      title: new Text(
        "CONTRA O RELÓGIO",
        style: TextStyle(color: Colors.red),
        textAlign: TextAlign.center,
      ),
      content: new Row(
        children: <Widget>[
          new Text(
              "Brevemente lançaremos a versão \ncompleta do jogo!\n\nSiga-nos:  \n - Facebook.com/omarraojogo\n - Instagram.com/omarraojogo")
        ],
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
          alertuser,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    animationController.forward();
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          final body = Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(38.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/marrao/red.png'), fit: BoxFit.fill),
            ),
            child: Column(
              children: <Widget>[
                Transform(
                    transform: Matrix4.translationValues(
                        muchDelayedAnimation.value * width, 0.0, 0.0),
                    child: Hero(
                      tag: 'hero',
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        //backgroundImage: AssetImage('assets/faq.png'),
                        radius: 90.0,
                        child: Image.asset('assets/marrao/logo.png'),
                      ),
                    )),
                SizedBox(height: 10.0),
                Transform(
                  transform: Matrix4.translationValues(
                      muchDelayedAnimation.value * width, 0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      shadowColor: Colors.deepOrange.shade700,
                      elevation: 10.0,
                      child: MaterialButton(
                        minWidth: 200.0,
                        height: 62.0,
                        onPressed: () {
                          Navigator.of(context).pushNamed("/SingleHome");
                        },
                        splashColor: Colors.greenAccent,
                        color: Colors.orange,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.perm_identity,
                              size: 45.0,
                              color: Colors.black54,
                            ),
                            Text(
                              ' Marrão',
                              style: TextStyle(
                                  fontSize: 35.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Mono Social Icons',
                                  color: Colors.black54),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.0),
                Transform(
                  transform: Matrix4.translationValues(
                      delayedAnimation.value * width, 0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      shadowColor: Colors.deepOrange.shade700,
                      elevation: 10.0,
                      child: MaterialButton(
                        minWidth: 200.0,
                        height: 62.0,
                        onPressed: () {
                          _alertVS();
                          //Navigator.of(context).pushNamed("/DoublePlay");
                        },
                        splashColor: Colors.lightBlue,
                        color: Colors.orangeAccent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //Text('VS - ', style: TextStyle(color: Colors.black54, fontSize: 40.0)),
                            Icon(
                              Icons.people_outline,
                              size: 60.0,
                              color: Colors.black54,
                            ),
                            Text(
                              ' Marrões',
                              style: TextStyle(
                                  fontSize: 35.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Mono Social Icons',
                                  color: Colors.black54),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.0),
                Transform(
                  transform: Matrix4.translationValues(
                      animation.value * width, 0.0, 0.0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      shadowColor: Colors.deepOrange.shade700,
                      elevation: 10.0,
                      child: MaterialButton(
                        minWidth: 200.0,
                        height: 62.0,
                        onPressed: () {
                          _alertTimer();
                          //Navigator.of(context).pushNamed("/DoublePlay");
                        },
                        splashColor: Colors.lightBlue,
                        color: Colors.orangeAccent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Marrão do ',
                              style: TextStyle(
                                  fontSize: 35.0,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Mono Social Icons',
                                  color: Colors.black54),
                            ),
                            Icon(
                              Icons.timer,
                              size: 60.0,
                              color: Colors.black54,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );

          return Scaffold(
            resizeToAvoidBottomPadding: false,
            body: body,
          );
        });
  }
}
