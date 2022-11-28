import 'package:flutter/cupertino.dart';
import 'package:untitled/ui/util/card_image.dart';
import 'package:untitled/ui/util/gradientBack.dart';

import 'card_image_list.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Stack(
      children: <Widget>[
        gradientBack("Bienvenida"),
        card_image_list()
      ],
    );
  }

}