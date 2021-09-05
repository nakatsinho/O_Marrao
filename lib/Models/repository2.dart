import 'package:flutter/material.dart';

class Repository2 extends StatelessWidget
{
  final Color _btnColor;
  final String _btnText;
  final String _btnChoice;
  final VoidCallback _onPressed;
  //final Icon _iconAnswer;

  Repository2 (this._btnColor, this._btnText, this._btnChoice, this._onPressed);

  @override
  Widget build(BuildContext context) {
    
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal,
          border: Border.all(
            width: 1.0,
            color: Colors.deepOrange,
            ),
          borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
          ),
        margin: const EdgeInsets.all(3.0),

        child: Column(
          children: <Widget>[
            new Container(
              width: double.infinity,
              padding: new EdgeInsets.only(left: 1.0, right: 1.0, top: 1.0, bottom: 1.0),
              child: MaterialButton(
                onPressed: ()=>_onPressed(),
                color: _btnColor,
                //highlightColor: _iconAnswer,

                child: Text(_btnText+". "+_btnChoice+"  ", style: TextStyle(color: Colors.white,fontSize: 18.0),),
                ),
              )
          ],
          ),
        ),
      );
  }
}