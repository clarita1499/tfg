import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class image_senales extends StatelessWidget{
  @override
  final String imagePath;
  final VoidCallback onPressed;

  image_senales(this.imagePath, this.onPressed);

  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox.fromSize(
      size: Size(70,70),
      child:  ClipOval(
        child: Material(
          child: InkWell(
            onTap: onPressed,
            child: Image.asset(imagePath),
          ),
        ),
      ),
    );
  }

}