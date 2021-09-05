import 'package:flutter/material.dart';
//import 'dart:math';

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
      color: widget._isCorrect ? Colors.transparent : Colors.transparent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(12.0),
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 67.0,
          height: 42.0,
          onPressed: ()=>Navigator.pop(context),
          //splashColor: Colors.purple,
          color: Colors.orange,
          child: Text('OK', style: TextStyle(color: Colors.black)),
          ),
        ),
      ),
          new Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Material(
              borderRadius: BorderRadius.circular(12.0),
              //shadowColor: Colors.lightBlueAccent.shade700,
              elevation: 5.0,
              child: MaterialButton(
                minWidth: 37.0,
                height: 42.0,
                onPressed: ()=>Navigator.pop(context),
                //splashColor: Colors.purple,
                color: Colors.white,
                child: Text('Cancelar', style: TextStyle(color: Colors.black)),
                ),
              ),
            ),
          /*new Container(
            width: double.infinity,
            child: new Transform.rotate(
              angle: _iconAnimation.value*2*pi,
                  child: new Icon(

                      widget._isCorrect ? Icons.done_all : Icons.clear, size: _iconAnimation.value*70.0, color: Colors.white,),
              ),
          )*/
        ],
      ),
    );
  }
}
