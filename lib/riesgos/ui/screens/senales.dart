import 'package:flutter/material.dart';
import 'package:untitled/riesgos/ui/widgets/gradientBack.dart';
import 'package:untitled/riesgos/ui/widgets/card_image_list.dart';


class senales extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final header_appBar =  Stack(
      children: <Widget>[
        gradientBack("SEÑALES"),
        card_image_list()
      ],
    );
    return header_appBar;
    //me falta ponerle txt explicativo y eso
  }
}

