import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/ui/screens/Anadir.dart';
import 'package:untitled/ui/screens/bienvenida.dart';
import 'package:untitled/ui/widgets/ui_riesgos/screens/consultaRL.dart';
import 'package:untitled/ui/widgets/ui_riesgos/screens/recomendaciones.dart';

import '../ui/screens/senales.dart';
import '../ui/screens/perfil.dart';

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
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
