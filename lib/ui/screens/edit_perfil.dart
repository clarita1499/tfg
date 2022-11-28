
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/main.dart';
import 'package:untitled/ui/util/button_inkWell.dart';
import 'package:untitled/ui/screens/perfil.dart';

import '../widgets/ui/widgets/menu_desplegable.dart';

class edit_perfil extends StatelessWidget{

  final List <String> itemsPuesto = ['PDI','PAS', 'Estudiante'];
  String selectedValuePuesto = 'Estudiante';

  final List <String> itemsProvincia = ['Zaragoza','Teruel', 'Huesca'];
  String selectedValueProvincia = 'Teruel';

  final List <String> itemsCentro = ['Universidad Poltécnica de Teruel', 'Unizar'];
  String selectedValueCentro = 'Universidad Poltécnica de Teruel';


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
    final email = TextField(
      key: const Key('Email'),
      controller: _ageController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          labelText: 'Email'
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

    return Scaffold(
      appBar: AppBar(title: Text("Edit user"),),
        body: ListView(
          children: <Widget> [
            name,
            const SizedBox(height: 8,),
            lastName,
            const SizedBox(height: 8,),
            age,
            const SizedBox(height: 8,),
            email,
            const SizedBox(height: 8,),
            MenuDesplegable(
                itemsPuesto,
                selectedValuePuesto),
            const SizedBox(height: 8,),
            MenuDesplegable(
                itemsProvincia,
                selectedValueProvincia),
            const SizedBox(height: 8,),
            MenuDesplegable(
                itemsCentro,
                selectedValueCentro),
            button_inkWell(
              button_txt: "Guardar",
              onPressed: (){},
            ),
          ],
        ),
         );

  }


}
