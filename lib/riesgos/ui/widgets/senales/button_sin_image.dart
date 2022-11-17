import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class button_sin_image extends StatelessWidget{
  @override
  final String texto;
  final VoidCallback onPressed;

  button_sin_image(this.texto, this.onPressed);

  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.white60,
      elevation: 3,
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
          ),
          child: Container(
            height: 20.0,
            width: 230.0,
              child : Text(
                texto,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            alignment: Alignment.center,
          ),
        ),

      ),
    );
  }
}