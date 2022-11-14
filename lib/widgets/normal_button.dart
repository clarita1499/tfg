import 'package:flutter/material.dart';

class normal_button extends StatelessWidget {

  final String txt;
  double width = 0.0;
  double height = 0.0;
  final VoidCallback onPressed;
  Color color;
  String imagePath;

  normal_button({
    Key? key,
    required this.txt,
    this.height = 0.0,
    required this.onPressed,
    this.width = 0.0,
    this.color = Colors.white, //por defecto
    required this.imagePath
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.white,
      elevation: 3,
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(6),
          child: Row(
            children: [
              Image.asset(imagePath, width: 24, height: 24),
              SizedBox(width: 20),
              Text(
                txt,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}

