import 'package:flutter/material.dart';
import 'package:untitled/riesgos/ui/screens/bienvenida.dart';
import 'package:untitled/riesgos/ui/screens/consultaRL.dart';
import 'package:untitled/riesgos/ui/screens/formulario.dart';
import 'package:untitled/riesgos/ui/screens/senales.dart';

class menu_principal extends StatefulWidget{
  @override
  State<StatefulWidget> createState()  {
    return _menu_principalState();
  }
  //=> _menu_principalState();
}

class _menu_principalState extends State<menu_principal>{
  //navegacion de 0 a n-1
   int indexTap = 0;

  final List <Widget> widgetsChildren = [
    bienvenida(),
    formulario(),
    consultarRL("CATEGORÍA", "01", "PANTALLAS DE VISUALIZACIÓN DE DATOS"),
    senales()
  ];
  void onTapTapped(int index){
    setState(() {
      indexTap = index;
    });
  }

  Widget build (BuildContext context){
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.grey,
            primaryColor: Colors.purple
        ),
        child: BottomNavigationBar (
          onTap: onTapTapped,
          currentIndex: indexTap,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Bienvenida"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.task_alt),
                label: "Formulario"
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
    

    /*  appBar: AppBar(title: Text("MENU PRINCIPAL")),
      backgroundColor: Colors.white60,
      body: Container(
        child: GridView.builder(
          itemCount: Menu.length,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(10)
              ),
              child: GestureDetector(
                onTap: () {
                  //PARA DEBUG
                  print("click en "+Menu[index].nombre);
                },
                child : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/"+Menu[index].foto, width: 100,),
                    Text(Menu[index].nombre)
                  ],
                ) ,
              )
            );
            }
        ),
      ),

     */
    );
  }
}


/*
FLutter es un sdk de desarrollo creado por google y fué creado para desarollar principlamente interfaces móviles nátivas en iOS y Android pero se puede llevar a lógica de negocio,
tiene un lenguaje de programación base que permite compartir código entre ambas plataformas o S.O
Utiliza el lenguaje de programación DART.
Genera aplicaciones nativas, no al 100% pero está dentro de Cross Platform, Flutter lo que hace es no compilar en bridge, va directamente al procesador.
SLia Canvas es quien se comunica con el procesador directamente.
Solo tiene 3 capas.
En Flutter, el equivalente a los Views, UIViews y Elements, con los que se componen las interfaces de las aplicaciones, son los Widgets, de hecho
todo en Flutter es en esencia, un Widget, y la forma en que se diseñan y se componen las interfaces es mediante la definición de árboles de Widgets
o Widget tree en los que todos los Widget de la interfaz están organizados de forma anidada y representan atributos o propiedades de este árbol.
en Android x ejemplo la forma de desarrollar interfaces es x XML
Flutter = widgtes: txt, botones, ... (views) la sintaxis es widget tree (anidados) poniendole características a sus propiedades
La principal diferencia es que mientras que React Native transpila (traduce) el código a Widgets Nativos para cada plataforma, Flutter compila
todo directamente a Nativo controlando cada pixel de la pantalla para evitar problemas de rendimiento causados por el bridge de JavaScript.
 */