import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/User/ui/screens/perfil.dart';
import 'package:untitled/riesgos/ui/screens/Anadir.dart';
import 'package:untitled/riesgos/ui/screens/bienvenida.dart';
import 'package:untitled/riesgos/ui/screens/consultaRL.dart';
import 'package:untitled/riesgos/ui/screens/recomendaciones.dart';

import '../riesgos/ui/screens/senales.dart';

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Navigation();
  }

}

class _Navigation extends State<Navigation> {
  int indexTap = 0;
  final List<Widget> widgetsChildren = [
    bienvenida(),
    anadir_consejo(),
    consultarRL(1, "", "", ""),
    recomendaciones(),
    senales(),
    perfil_screen(),
  ];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build


    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.blue,
            primaryColor: Colors.purple
        ),
        child: BottomNavigationBar(
            onTap: onTapTapped,
            currentIndex: indexTap,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Bienvenida"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle),
                  label: "Añadir"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: "Busqueda PRL"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.recommend),
                  label: "Recomendaciones"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.dataset),
                  label: "Señales"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Perfil"
              ),
            ]
        ),
      ),
    );
  }
}
