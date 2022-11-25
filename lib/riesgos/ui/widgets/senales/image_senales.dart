import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class image_senales extends StatelessWidget{
  @override
  final String imagePath;
 // final VoidCallback onPressed;

  image_senales(this.imagePath);

  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox.fromSize(
      size: Size(70,70),
      child:  ClipOval(
        child: Material(
          child: InkWell(
            onTap:  () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 300.0,
                    color: Colors.white60,
                    child: Column(
                      children: [
                        Text(
                            "TITULO"
                        ),
                        Text(
                            "DESCRIPCIÓN"
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Image.asset(imagePath),
          ),
        ),
      ),
    );
  }

}