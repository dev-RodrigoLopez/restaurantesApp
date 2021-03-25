import 'package:flutter/material.dart';

class Boton extends StatelessWidget {

  final String text;
  final Function onPresed;

  const Boton({
    Key key, 
    @required this.text, 
    @required this.onPresed
  }): super(key: key);



  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 2,
      highlightElevation: 5,
      color: Colors.red[500],
      shape: StadiumBorder(),
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(this.text, style: TextStyle( color: Colors.white, fontSize: 17 )),
        ),
      ),
      onPressed: this.onPresed,
    ); 
  }
}