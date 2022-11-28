import 'package:flutter/material.dart';
import 'package:untitled/ui/screens/Se%C3%B1ales/se%C3%B1ales_prohibicion.dart';
import 'package:untitled/ui/screens/señales/senales_advertencia.dart';
import 'package:untitled/ui/screens/Se%C3%B1ales/senales_incendio.dart';
import 'package:untitled/ui/screens/Se%C3%B1ales/senales_salvamento.dart';
import 'package:untitled/ui/util/gradientBack.dart';
import '../util/button_inkWell.dart';


class senales extends StatelessWidget{
  @override
  Widget build(BuildContext context) {


    return ListView(
        children: <Widget>[
          gradientBack("Señales"),
          button_inkWell(
              button_txt: "1. Señales de prohibición",
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => senales_prohibicion()
                  ),
              ),
          ),
          button_inkWell(
              button_txt: "2. Señales de salvamento",
              onPressed: ()=> Navigator.push(context,
                  MaterialPageRoute(
                      builder: (context) => senales_salvamento()
                  ),
              ),
          ),
          button_inkWell(
              button_txt: "3. Señales de advertencia",
              onPressed: () => Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => senales_advertencia()
                ),
              ),
          ),
          button_inkWell(
              button_txt: "4. Señales contra incendio",
              onPressed: () => Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => senales_incendio()
                ),
              ),
          ),
        ],
    );
  }
}

