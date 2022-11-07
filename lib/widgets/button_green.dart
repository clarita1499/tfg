import 'package:flutter/material.dart';

class button_green extends StatefulWidget{

  final String txt;

  double width = 0.0;
  double height = 0.0;

  final VoidCallback onPressed;

  button_green( {required this.txt ,this.height = 0.0, required this.onPressed, this.width = 0.0});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _button_green();
  }

}

class _button_green extends State<button_green>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(
          top: 30.0,
          left: 20.0,
          right: 20.0
        ),
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          gradient: LinearGradient(
            colors: [
              Color(0xFFa7ff84), //arriba
              Color(0xFF1cbb78) //abajo
            ],
            begin: FractionalOffset(0.2,0.0),
            end: FractionalOffset(1.0,0.6),
            stops: [0.0,0.6],
            tileMode: TileMode.clamp
          )
        ),
         child: Center(
           child: Text(
             widget.txt,
             style: TextStyle(
               fontSize: 18.0,
               fontFamily: "Lato",
               color: Colors.white
             ),
           ),
         ),
      ),
    );
  }

}