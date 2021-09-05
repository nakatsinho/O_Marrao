import 'dart:math';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget
{
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation<double> animation_rotation;
  Animation<double> animation_radius_in;
  Animation<double> animation_radius_out;

  final double initialRadius = 50.0;

  double radius = 0.0;

  @override
  void initState(){
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(seconds: 10));
    animation_rotation = Tween <double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Interval(0.0, 1.0, curve: Curves.linear)));
    animation_radius_in = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: controller, curve: Interval(
        0.75, 1.0, curve: Curves.elasticIn)));

    animation_radius_out = Tween<double>(
      begin: 1.0,
      end: 0.0,
      ).animate(CurvedAnimation(parent: controller, curve: Interval(
        0.0, 0.25, curve: Curves.elasticOut)));

    controller.addListener((){
      setState(() {
        if(controller.value >= 0.75 && controller.value <= 1.0){
          radius = animation_radius_in.value * initialRadius;
        }
        else if(controller.value >= 0.0 && controller.value <= 0.25){
          radius = animation_radius_out.value * initialRadius;
        }
      });
    });
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 100.0,
      width: 100.0,
      child: Center(
        child: RotationTransition(
          turns: animation_rotation,
          child: Stack(
            children: <Widget>[
              Ponto(
                radius: 30.0,
                color: Colors.transparent,
              ),
              Transform.translate(
                  offset: Offset(radius * cos(pi/4), radius * sin(pi/4)),
                  child: Ponto(
                    radius: 7.0,
                    color: Colors.blue,
                  ),
                  ),
              Transform.translate(
                offset: Offset(radius * cos(2*pi/4), radius * sin(2*pi/4)),
                child: Ponto(
                  radius: 7.0,
                  color: Colors.orange,
                  ),
                ),
              Transform.translate(
                offset: Offset(radius * cos(3*pi/4), radius * sin(3*pi/4)),
                child: Ponto(
                  radius: 7.0,
                  color: Colors.green,
                  ),
                ),
              Transform.translate(
                offset: Offset(radius * cos(4*pi/4), radius * sin(4*pi/4)),
                child: Ponto(
                  radius: 7.0,
                  color: Colors.redAccent,
                  ),
                ),
              Transform.translate(
                offset: Offset(radius * cos(5*pi/4), radius * sin(5*pi/4)),
                child: Ponto(
                  radius: 7.0,
                  color: Colors.amber,
                  ),
                ),
              Transform.translate(
                offset: Offset(radius * cos(6*pi/4), radius * sin(6*pi/4)),
                child: Ponto(
                  radius: 7.0,
                  color: Colors.purple,
                  ),
                ),
              Transform.translate(
                offset: Offset(radius * cos(7*pi/4), radius * sin(7*pi/4)),
                child: Ponto(
                  radius: 7.0,
                  color: Colors.white,
                  ),
                ),
              Transform.translate(
                offset: Offset(radius * cos(8*pi/4), radius * sin(8*pi/4)),
                child: Ponto(
                  radius: 7.0,
                  color: Colors.purpleAccent,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class Ponto extends StatelessWidget
{
  final double radius;
  final Color color;

  Ponto ({this.color,this.radius});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      width: this.radius,
      height: this.radius,
      decoration: BoxDecoration(
        color: this.color,
        shape: BoxShape.circle,
      ),
    );
  }

}