import 'package:flutter/material.dart';
import 'package:untitled/riesgos/ui/widgets/senales/senales1.dart';
import 'package:untitled/riesgos/ui/widgets/senales/senales2.dart';
import 'package:untitled/riesgos/ui/widgets/senales/senales3.dart';
import 'package:untitled/riesgos/ui/widgets/gradientBack.dart';
import 'package:untitled/riesgos/ui/widgets/senales/header_senales.dart';
import 'package:untitled/riesgos/ui/widgets/senales/image_senales.dart';


class senales extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return ListView(
        children: <Widget>[
          header_senales(),
          senales1(),
          senales2(),
          senales3(),
    ],
    );

  }
}

