import 'package:flutter/material.dart';
import 'dart:math';

class CustomizeOverlay extends StatefulWidget{
  final bool _isCorrect;
  CustomizeOverlay(this._isCorrect);

  @override
  State createState() => _CustomizeOverlayState();
}

class _CustomizeOverlayState extends State<CustomizeOverlay> with SingleTickerProviderStateMixin
{
  Animation _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(vsync: this, duration: new Duration(seconds: 2));
    _iconAnimation = new CurvedAnimation (parent:_iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(()=>this.setState((){}));
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context)
  {
    return Material(
      color: widget._isCorrect ? Colors.green : Colors.redAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            width: double.infinity,
            child: new Transform.rotate(
              angle: _iconAnimation.value*2*pi,
              child: new Icon(

                widget._isCorrect ? Icons.done_all : Icons.clear, size: _iconAnimation.value*50.0, color: Colors.white,),
              ),
            )
        ],
        ),
      );
  }
}
