
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/util/button_inkWell.dart';
import 'package:untitled/screens/perfil.dart';
import 'package:untitled/widgets/lista_desplegables.dart';
import 'package:untitled/util/normal_button.dart';

class edit_perfil extends StatelessWidget{

  final _nameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    // TODO: implement build

    final name = TextField(
      key: const Key('Name'),
      controller: _nameController,
      decoration: const InputDecoration(
          labelText: 'Name'
      ),
    );

    final lastName = TextField(
      key: const Key('Last Name'),
      controller: _lastNameController,
      decoration: const InputDecoration(
          labelText: 'Last Name'
      ),
    );

    final age = TextField(
      key: const Key('Age'),
      controller: _ageController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          labelText: 'Age'
      ),
    );

    final puesto = Drawer(
      child: Column(
        children: <Widget>[
          ExpansionTile(
            title: Text("Expansion Title"),
            children: <Widget>[Text("Profesor"),
              Text("Administración"),
              Text("Alumnos")],
          )
        ],
      ),
    );
    /*¿Cómo se hace un desplegable?
      -PUESTO DE TRABAJO
      -PROVINCIA
      -CENTRO DE TRABAJO
     */



    return Scaffold(
        body: ListView(
          children: <Widget> [
            name,
            const SizedBox(height: 8,),
            lastName,
            const SizedBox(height: 8,),
            age,
            button_inkWell(
              button_txt: "Atrás",
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => new perfil_screen()),);
              },
            ),
            button_inkWell(
              button_txt: "Guardar",
              onPressed: (){},
            ),
          ],
        ),
         );

  }

}