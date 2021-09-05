import 'package:flutter/material.dart';

class Repository extends StatelessWidget
{
  final Color _btnColor;
  final String _btnText;
  final String _btnChoice;
  final VoidCallback _onPressed;

  Repository (this._btnColor, this._btnText, this._btnChoice, this._onPressed);

  @override
  Widget build(BuildContext context) {
    
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            width: 1.0,
            color: Colors.transparent,
          ),
          borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
        ),
        //margin: const EdgeInsets.all(0.0),


        child: Column(
          children: <Widget>[
            Container(
              child: new MaterialButton(
                //margin: EdgeInsets.all(2.0),
                onPressed: ()=>_onPressed(),
                  color: _btnColor,
                  minWidth: 360.0,
                  height: 50.0,
                child: new Row(
                  children: <Widget>[
                    /*new CircleAvatar(
                      radius: 30.0,
                      foregroundColor: Theme.of(context).primaryColor,
                      backgroundColor: Colors.white,
                      //backgroundImage: new AssetImage('assets/marrao/historia.png'),
                      ),*/
                    Text("     "+_btnText+". "+_btnChoice+"  ", style: TextStyle(
                        fontSize: 18.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Mono Social Icons',
                        color: Colors.black
                        ),textAlign: TextAlign.start,)
                  ],
                )
                ),
              ),
            Padding(padding: const EdgeInsets.symmetric(vertical: 0.1)),
          ],
        ),padding: const EdgeInsets.symmetric(horizontal: 15.0),
      ),
    );
  }
}
