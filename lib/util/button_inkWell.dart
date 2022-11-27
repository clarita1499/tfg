import 'package:flutter/material.dart';

class button_inkWell extends StatelessWidget{
  @override
  final String button_txt;
  final VoidCallback onPressed;

  button_inkWell({required this.button_txt, required this.onPressed});

  Widget build(BuildContext context) {
    // TODO: implement build
   return InkWell(
     onTap: onPressed,
     child: Container(
       margin: EdgeInsets.only(
         top: 30.0,
         left: 20.0,
         right: 20.0
       ),
       height: 50.0,
       width: 180.0,
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(30.0),
         gradient: LinearGradient(
             colors:[
               Color(0xFF4268D3),
               Color(0xFF584CD1)
             ],
           begin: FractionalOffset(0.2,0.0),
           end: FractionalOffset (1.0,0.6),
           stops: [0.0,0.6],
           tileMode: TileMode.clamp
         ),
       ),
        child: Center(
          child: Text(
            button_txt,
            style: TextStyle(
              fontSize: 18.0,
              fontFamily: "Lato",
              color : Colors.white
            ),
          ),
        ),
     ),
   );
  }
  
}
