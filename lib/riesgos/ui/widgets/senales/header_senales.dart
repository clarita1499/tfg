import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/riesgos/ui/widgets/senales/button_sin_image.dart';
import 'package:untitled/widgets/normal_button.dart';

import 'senales1.dart';
import 'senales2.dart';
import '../gradientBack.dart';

class header_senales extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    final buttons = Center(
      child: Column(
        children: [
          SizedBox(height: 90),
          button_sin_image("1.Señales de prohibición",
            () {}),
          SizedBox(height: 8),
          button_sin_image("2.Señales de salvamento",
                  () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => new senales2()
                ),
                );
              }),
          SizedBox(height: 8),
          button_sin_image("3.Señales de advertencia",
                  () { }),
          SizedBox(height: 8),
          button_sin_image("4.Señales contra incendio",
                  () { }),
        ],
      ),
    );
    return Stack(
      children: [
        gradientBack("Señales"),
        buttons,
      ],
    );
  }

}